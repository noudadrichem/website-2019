<template>
  <div :class="['page', $route.params.page]">
    <div class="container">
      <div v-for="(contentObj, idx) in page.content" :key="idx">
        <div v-if="contentObj.type.startsWith('text')">
          <TextBlock
            :type="contentObj.type"
            :title="contentObj.title"
            :subTitle="contentObj.subTitle"
            :text="contentObj.description"
            :button="contentObj.button"
            :card="contentObj.card"
            :textLink="contentObj.textLink"
          />
        </div>

        <div v-if="contentObj.type.startsWith('image')">
          <ImageBlock
            :type="contentObj.type"
            :title="contentObj.title"
            :text="contentObj.description"
            :image="contentObj.imgUrl"
            :button="contentObj.button"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  import TextBlock from '../../components/TextBlock'
  import ImageBlock from '../../components/ImageBlock'

  export default {
  components: {
    TextBlock,
    ImageBlock
  },
  data: () => ({
    page: {}
  }),
  async validate({ params }) {
    const { data } = await axios.get(`https://old.indicium.hu/json/events?filter[slug]=${params.activiteit}`)
    return data.meta.count === 1
  },
  async mounted() {
    const { data } = await axios.get(`https://old.indicium.hu/json/events?filter[slug]=${this.$route.params.activiteit}`)
    const pageData = this.transform(data.data[0])
    this.$set(this, 'page', pageData)
    console.log({ pageData })
  },
  methods: {
    transform(oldSitePage) {
      const newSitePage = {
        title: oldSitePage.attributes.title,
        content: [],
      }
      oldSitePage.attributes.contentblocks
        .forEach((block) => {
          newSitePage.content[newSitePage.content.length] = {
            type: 'text-left',
            description: block.content
          }
        })
      return newSitePage
    }
  },
  head() {
    return {
      title: this.page.title !== undefined ? this.page.title : 'Indicium',
      meta: [
        {
          hid: 'description',
          name: 'description',
          content:
              this.page.description !== undefined
                ? this.page.description
                : 'content.description'
        }
      ]
    }
  }
}
</script>

<style scoped>

</style>
