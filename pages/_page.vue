<template>
  <div>
    <h1>Page</h1>

    {{ $data }}
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
  }
}
</script>
