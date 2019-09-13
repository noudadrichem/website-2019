<template>
  <div v-if="type === 'center'" :class="['text-block', type]">
    <h1>{{ title }}</h1>
    <p>{{ text }}</p>
    <Button v-if="readMoreButtonText !== ''" :onClick="readMoreCallback" size="l" :center="type === 'center'" :url="url">
      {{ readMoreButtonText }}
    </Button>
  </div>

  <div v-else-if="type === 'left-image'" :class="['text-block', type]">
    <div class="image">
      <img :src="image" alt="sponsor logo title" />
    </div>
    <div class="text">
      <h1>{{ title }}</h1>
      <p>{{ text }}</p>
      <Button v-if="readMoreButtonText !== ''" :onClick="readMoreCallback" size="l" :url="url">
        {{ readMoreButtonText }}
      </Button>
    </div>
  </div>

  <div v-else-if="type === 'right-image'" :class="['text-block', type]">
    <div class="text">
      <h1>{{ title }}</h1>
      <p>{{ text }}</p>
      <Button v-if="readMoreButtonText !== ''" :onClick="readMoreCallback" size="l" :url="url">
        {{ readMoreButtonText }}
      </Button>
    </div>
    <div class="image">
      <img :src="image" alt="sponsor logo title" />
    </div>
  </div>

  <div v-else class="text-block">
    <h1>{{ title }}</h1>
    <p>{{ text }}</p>
    <Button v-if="readMoreButtonText !== ''" :onClick="readMoreCallback" size="l" :url="url">
      {{ readMoreButtonText }}
    </Button>
  </div>
</template>

<script>
import Button from './interactions/button'

export default {
  name: 'TextBlock',
  components: { Button },
  props: {
    type: {
      type: String,
      default: ''
    },
    url: {
      type: String,
      default: '#'
    },
    title: {
      type: String,
      default: 'title'
    },
    text: {
      type: String,
      default: 'text'
    },
    image: {
      type: String,
      default: 'https://via.placeholder.com/348x408/f2'
    },
    readMoreCallback: {
      type: Function,
      default: () => {
        console.log('Clicked read more')
      }
    },
    readMoreButtonText: {
      type: String,
      default: ''
    }
  }
}
</script>

<style lang="scss">
.text-block {
  max-width: 928px;
  margin: 0 auto;
  padding: 96px 0;

  &.center {
    text-align: center;
    @media screen and (max-width: 414px) {
      margin: 0 16px;
    }
  }

  &.left-image, &.right-image {
    display: flex;
    flex-wrap: wrap;
    align-items: center;

    .image {
      flex-grow: 1;
      flex-basis: calc(50% - 32px);
      padding: 0 16px;
      min-width: 348px;
      @media screen and (min-width: 414px) {
        margin-top: 32px;
      }
      img {
        display: block;
        max-width: 100%;
      }
    }
    .text {
      flex-grow: 1;
      flex-basis: calc(50% - 32px);
      padding: 0 16px;
    }
  }
  &.right-image Button {
    margin-bottom: 8px;
  }
  Button {
    display: inherit;
  }
}
</style>
