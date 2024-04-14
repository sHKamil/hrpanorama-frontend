<template>
    <form @submit.prevent="logIn()">
      <div class="inner-content">
            <q-input filled v-model="username" label="Username" stack-label />
            <q-input type="password" filled v-model="password" label="Password" stack-label />
            <q-btn type="submit" unelevated color="primary" label="Login" />
      </div>
    </form>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { api } from 'boot/axios';
import { Notify } from 'quasar'
import { useRouter } from 'vue-router';

const username = ref('');
const password = ref('');
const API_URL = process.env.API;
const router = useRouter();


async function logIn() {
    try {
        const response = await api.post('/', {
            "username": username.value,
            "password": password.value
        });
        localStorage.setItem('token', response.data.token);
        router.push('/dashboard')
    } catch (error) {
        if(error.response.status === 403) {
          Notify.create({
            message: 'Wrong password or login!',
            color: 'red'
          });
        }
        console.error('Error logging in:', error);
        throw error;
    }
}

</script>

<style scoped>
  .inner-content {
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 2rem;
  }
  form{
    padding: 2rem;
    border-radius: .5rem;
    border: 1px solid #1976D2;
  }
</style>
  