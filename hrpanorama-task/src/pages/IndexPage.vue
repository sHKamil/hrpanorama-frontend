<template>
  <q-page class="row items-center justify-evenly">
    <LoginComponent

    ></LoginComponent>
  </q-page>
</template>

<script setup lang="ts">
import LoginComponent from 'components/LoginComponent.vue';

defineOptions({
  name: 'IndexPage'
});

</script>
