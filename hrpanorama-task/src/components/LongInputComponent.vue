<template>
    <q-btn class="logout" type="button" unelevated color="negative" label="Logout" v-on:click="logout()"/>
    <form @submit.prevent="send">
        <q-input class="longInput" filled v-model="content" label="Content" stack-label :style="{
            width: content.length + 7 + 'ch',
            }"/>
        <q-btn type="submit" unelevated color="primary" label="Send" />
    </form>
    <div class="container">
        <img v-if="imgSource" :src="imgSource" />
        <object v-if="pdfSource" class="pdf" :data="pdfSource" type="application/pdf"><p>Your web browser doesnt have a PDF plugin. Instead you can <a :href="pdfSource">click here to download the PDF file.</a></p></object>
    </div>

</template>

<script setup lang="ts">
import { ref } from 'vue';
import { api } from 'boot/axios';
import { Notify, useQuasar } from 'quasar'
import { useRouter } from 'vue-router';

const $q = useQuasar();
const content = ref('');
const pdfSource = ref('');
const imgSource = ref('');
const API_URL = process.env.API;
const router = useRouter();


api.interceptors.request.use((config) => {
    config.headers.Authorization = `Bearer ${localStorage.getItem('token')}`;
    return config;
});

async function send() {
    try {
        const response = await api.post('/pdf', {
            "content": content.value
        });
        pdfSource.value = API_URL + "/" + response.data.pdfPath + '#view=FitH';
        imgSource.value = API_URL + "/" + response.data.imgPath;
        $q.dialog({
          title: 'PDF Created',
          message: '<object style="width: 100%; height: 70dvh;" data="' + pdfSource.value + '" type="application/pdf"><p>Your web browser doesnt have a PDF plugin. Instead you can <a href="' + pdfSource.value + '">click here to download the PDF file.</a></p></object>',
          html: true,
        })
    } catch (error) {
        Notify.create({
            message: 'Error: ' + error,
            color: 'red'
        });
        console.error('Error logging in:', error);
        throw error;
    }
}

function logout() {
    localStorage.removeItem('token');
    delete api.defaults.headers.common['Authorization'];
    router.push('/');
}

</script>

<style scoped>
  .container {
    display: flex;
    flex-direction: column;
    width: fit-content;
    gap:2rem;
    margin: 5rem auto auto auto;
  }
  .longInput{
    min-width: 10ch;
    max-width: 95vw;
    font-family: monospace;
  }
  .pdf{
    width: 450px;
    height: 400px;
  }

  img{
    width: 250px;
    margin:auto;
  }
  form{
    display: flex;
    flex-direction: column;
    width: fit-content;
    gap: 1rem;
    padding: 1rem;
    border-radius: .5rem;
    margin: 6rem auto auto auto;
    border: 1px solid #1976D2;
  }
  .logout{
    margin: 2rem;
  }

  @media only screen and (max-width: 600px) {
    embed{
        width: 250px;
        height: 300px;
    }
    img{
        width: 150px;
    }
  }

  @media only screen and (max-width: 300px) {
    .pdf{
        width: 150px;
        height: 200px;
    }
    img{
        width: 150px;
    }
  }

</style>
  