<template>
  <div id="events" class="events-container">
    <h2 class="center">
      Opkomende activiteiten
    </h2>

    <div class="categories">
      {{ activeCategories }}
      <ul>
        <li v-for="(category, idx) in allCategories" :key="idx" @click="filterCategories(category)" :class="{ 'in-active': !activeCategories.includes(category.courseTitle) }">
          <span :style="{backgroundColor: `#${category.hex}`}"></span>{{ category.courseTitle }}
        </li>
      </ul>
    </div>

    <div v-if="!isLoading && events.length > 0" class="events">
      <EventTile v-for="(event, idx) in filteredEvents" :key="idx" :event="event" :allCategories="allCategories" />
    </div>
    <Loading v-else-if="isLoading" />
    <div v-else-if="!isLoading && events.length === 0">
      <p class="center">Geen opkomende activiteiten gevonden... 😢</p>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
import axios from 'axios'
import EventTile from './EventTile'
import Loading from './Loading'
const sample_events = [{
    "id": "32",
    "type": "events",
    "attributes": {
      "slug": "code-dive",
      "datecreated": "2019-09-19T11:25:37+02:00",
      "datechanged": "2019-09-20T15:46:37+02:00",
      "datepublish": "2019-09-19T11:24:51+02:00",
      "datedepublish": "",
      "ownerid": "15",
      "status": "published",
      "templatefields": [],
      "title": "Test 1b ",
      "start": "2019-11-19T00:00:00+01:00",
      "end": "2019-11-23T00:00:00+01:00",
      "categories": [
        "SD",
        "TI",
      ],
      "incomingrelation": "",
      "contentblocks": [{
        "content": "<p>TESTTT</p>",
        "image": {
          "file": "",
          "url": "https:\/\/old.indicium.hu\/files\/",
          "thumbnail": "https:\/\/old.indicium.hu\/thumbs\/400x300\/"
        },
        "outline": "right",
        "_block": "section"
      }]
    }
  },
  {
    "id": "33",
    "type": "events",
    "attributes": {
      "slug": "code-dive",
      "datecreated": "2019-09-19T11:25:37+02:00",
      "datechanged": "2019-09-20T15:46:37+02:00",
      "datepublish": "2019-09-19T11:24:51+02:00",
      "datedepublish": "",
      "ownerid": "15",
      "status": "published",
      "templatefields": [],
      "title": "Test 2",
      "start": "2019-11-19T00:00:00+01:00",
      "end": "2019-11-23T00:00:00+01:00",
      "categories": [
        "SD",
        "AI",
        "BIM",
        "SNE",
      ],
      "incomingrelation": "",
      "contentblocks": [{
        "content": "<p>TESTTT 22</p>",
        "image": {
          "file": "",
          "url": "https:\/\/old.indicium.hu\/files\/",
          "thumbnail": "https:\/\/old.indicium.hu\/thumbs\/400x300\/"
        },
        "outline": "right",
        "_block": "section"
      }]
    },
  }
]

export default {
  name: 'Events',
  components: {
    EventTile,
    Loading
  },
  data: () => ({
    isLoading: true,
    events: [],
    activeCategories: ['SD', 'TI', 'SNE', 'BIM', 'AI'],
    allCategories: [
      {
        courseTitle: 'SD',
        hex: 'E17272'
      },
      {
        courseTitle: 'TI',
        hex: 'A2E172'
      },
      {
        courseTitle: 'SNE',
        hex: 'E1DB72'
      },
      {
        courseTitle: 'BIM',
        hex: '727AE1'
      },
      {
        courseTitle: 'AI',
        hex: '72E1AD'
      },
    ]
  }),
  mounted() {
    this.fetchEvents()
  },
  computed: {
    filteredEvents() {
      return this.events.filter(evt => {
        return evt.title
      })
      // if event categories includes non active category so is not in active category list. don't return event
    }
  },
  methods: {
    stripHTMLFromString(str = '') {
      return str.replace(/(<([^>]+)>)/ig, '').replace(/\n|\r/g, '')
    },
    fetchEvents() {
      axios.get('https://old.indicium.hu/json/events?page%5Bsize%5D=1000')
        .then((response) => {
          const events = response.data.data
          const today = new Date().getTime()
          const featureEvents = events
            .filter(evt => new Date(evt.attributes.start).getTime() > today)
            .map(evt => ({
              title: evt.attributes.title,
              description: this.stripHTMLFromString(evt.attributes.contentblocks[0].content),
              date: new Date(evt.attributes.start).getTime() / 1000,
              url: `https://old.indicium.hu/evenement/${evt.attributes.slug}`,
              categories: evt.attributes.categories
            }))

          this.$set(this, 'isLoading', false)
          this.$set(this, 'events', featureEvents)
        })
        .then(this.addSampleEvents)
        .then(() => this.$set(this, 'filteredEvents', this.events))
    },
    addSampleEvents() {
      const mappedEvt = sample_events.map(evt => ({
        title: evt.attributes.title,
        description: this.stripHTMLFromString(evt.attributes.contentblocks[0].content),
        date: new Date(evt.attributes.start).getTime() / 1000,
        url: `https://old.indicium.hu/evenement/${evt.attributes.slug}`,
        categories: evt.attributes.categories
      }))

      this.$set(this, 'events', [...this.events, ...mappedEvt])
    },
    filterCategories({ courseTitle }) {
      const catIdx = this.activeCategories.indexOf(courseTitle)
      if(this.activeCategories.includes(courseTitle)) {
        this.activeCategories.splice(catIdx, 1)
      } else {
        this.activeCategories.push(courseTitle)
      }
    }
  }
}
</script>

<style lang="scss">
@import '../assets/scss/variables.scss';

.events-container {
  max-width: 1084px;
  margin: 40px auto;

  .categories {
    ul {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;

      li {
        display: inline-flex;
        align-items: center;
        padding: 16px;

        &.in-active span {
          background-color: lightgrey !important;
        }

        @media screen and (max-width: $bp-tablet-sm) {
          padding: 8px;
        }

        span {
          display: inline-flex;
          width: 24px;
          height: 24px;
          background-color: #f2f2f2;
          margin-right: 8px;
          box-shadow: 0 0 20px 0 rgba(186, 186, 186, .3);
          transition: box-shadow 300ms;

        }
      }
    }
  }

  .events {
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    flex-wrap: wrap;
  }
}
</style>
