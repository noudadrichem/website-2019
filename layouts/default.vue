<template>
  <div>
    <NavToggle />
    <Nav />
    <nuxt />
    <Footer />
  </div>
</template>

<script>
import NavToggle from '../components/NavToggle'
import Nav from '../components/Nav'
import Footer from '../components/Footer'

export default {
  components: {
    NavToggle,
    Nav,
    Footer
  }
}
</script>
