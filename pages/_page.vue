<template>
  <div class="container">
    <h1>{{ page.title }}</h1>

    <div v-for="(contentObj, idx) in page.content" :key="idx">

      <!-- {{ idx }} :{{ contentObj }} -->

      <div v-if="contentObj.type === 'text-center'">

      </div>
      <div v-if="contentObj.type === 'text-left'">

      </div>
      <div v-if="contentObj.type === 'text-right'">

      </div>
      <div v-if="contentObj.type === 'image-left'">

      </div>
      <div v-if="contentObj.type === 'image-righ'">

      </div>

    </div>
  </div>
</template>

<script>
/* eslint-disable */
import content from '../content.json'

export default {
  data:() => ({
    page: {}
  }),
  validate({ params }) {
    return content.pages.some(page => page.slug === params.page)
  },
  mounted() {
    const pageData = content.pages.find(p => p.slug === this.$route.params.page)
    this.$set(this, 'page', pageData)
    console.log({ pageData })
  }
}
</script>
