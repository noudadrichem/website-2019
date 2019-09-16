<template>
  <div v-if="type === 'text-center'" :class="['text-block', type, { contained }]">
    <h1 v-if="title">{{ title }}</h1>
    <h4 v-if="subTitle">{{ subTitle }}</h4>
    <p v-if="text" v-html="text"></p>

    <Button v-if="button" size="l" :center="type === 'center'" :url="button.url">
      {{ button.text }}
    </Button>
  </div>

  <div v-else-if="type === 'text-left'" :class="['text-block', type, { contained }]">
    <h1 v-if="title">{{ title }}</h1>
    <h4 v-if="subTitle">{{ subTitle }}</h4>
    <p v-if="text" v-html="text"></p>

    <Button v-if="button" size="l" :center="type === 'center'" :url="button.url">
      {{ button.text }}
    </Button>
  </div>

  <div v-else-if="type === 'text-right'" :class="['text-block', type, { contained }]">
    <h1 v-if="title">{{ title }}</h1>
    <h4 v-if="subTitle">{{ subTitle }}</h4>
    <p v-if="text" v-html="text"></p>

    <Button v-if="button" size="l" :center="type === 'center'" :url="button.url">
      {{ button.text }}
    </Button>
  </div>

  <div v-else class="text-block">
    <h1 v-if="title">{{ title }}</h1>
    <h4 v-if="subTitle">{{ subTitle }}</h4>
    <p v-if="text" v-html="text"></p>

    <Button v-if="button" size="l" :url="button.url">
      {{ button.text }}
    </Button>
  </div>
</template>

<script>
/* eslint-disable */
import Button from './interactions/button'

export default {
  name: 'TextBlock',
  components: { Button },
  props: {
    contained: {
      type: Boolean,
      default: false
    },
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
    },
    subTitle: {
      type: String,
    },
    text: {
      type: String,
      default: ''
    },
    button: {
      type: Object,
      default: null
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/scss/variables.scss';

.text-block {
  margin: 0 auto 32px;

  &.contained {
    max-width: 928px;
  }

  &.text-center {
    text-align: center;
    @media screen and (max-width: $bp-tablet-sm) {
      margin: 0 16px;
      text-align: left;
    }
  }

  &.text-right {
    text-align: right;
  }
}
</style>
