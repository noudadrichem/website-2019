<template>
  <div class="heading">
    <AnimatedLine :top="0" right="-10px" :interval="2000" />
    <AnimatedLine right="75px" :bottom="0" :interval="4000" :rotate="90"/>
    <AnimatedLine right="115px" :bottom="0" :interval="6000" :rotate="90"/>
    <AnimatedLine :left="0" top="128px" :interval="8000" :rotate="180"/>

    <AnimatedLine left="20%" bottom="-50px" :interval="4500" :rotate="135" v-if="thisWindow.innerWidth > 1500" />
    <AnimatedLine left="-150px" top="-100px" :interval="6000" :rotate="225" v-if="thisWindow.innerWidth > 1500" />

    <div class="heading-content">
      <img src="/logo/indicium-logo-top.svg" alt="Indicium Logo" />

      <h1>Wij zijn de <span class="bold">studie</span>vereniging voor HBO-ICT van Hogeschool Utrecht</h1>

      <div class="buttons">
        <Button size="l" :onClick="signUp" url="https://docs.google.com/forms/d/e/1FAIpQLSeYE3T-IdYrxb1FB2wKGtltf5D16aLzsDdaW3g1IZAj5Lxj3Q/viewform">
          Wordt lid
        </Button>
        <TextLink url="/activiteiten">
          Bekijk agenda
        </TextLink>
      </div>
    </div>
  </div>
</template>

<script>
import Button from '../components/interactions/button'
import TextLink from '../components/interactions/TextLink'
import AnimatedLine from '../components/AnimatedLine'

export default {
  name: 'Heading',
  components: {
    Button,
    TextLink,
    AnimatedLine
  },
  computed: {
    thisWindow() {
      if (process.client) {
        return window;
      }
    }
  },
  methods: {
    navigateToCalendar() {
      // eslint-disable-next-line no-restricted-globals
      setTimeout(() => { location.href = '#events' }, 1)
    },
    signUp() {
      console.log('kek')
    }
  }
}
</script>

<style lang="scss" scoped>
.heading {
  display: flex;
  justify-content: center;
  padding: 128px 0 192px;
  position: relative;

  &-content {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;

    h1 {
      max-width: 832px;
    }

    .buttons {
      display: flex;
      align-items: center;
      justify-self: center;

      .btn {
        margin-right: 32px;
      }
    }
  }
}
</style>
