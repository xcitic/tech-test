<template>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="card">
                <div class="card-header text-center">
                  <h1>VG Nyheter</h1>
                </div>
                  <!-- <div v-if="loading" class="justify-content-center">
                    <icons :icon="['fas', 'spinner']" class="fa-spinner" />
                  </div> -->

                  <table class="table table-hover">
                    <thead class="thead-dark">
                      <th scope="col">Dato</th>
                      <th scope="col">Tittel</th>
                      <th scope="col">Beskrivelse</th>
                      <th scope="col">Link</th>
                    </thead>
                    <tbody>
                      <tr v-for="nyhet in artikler" :key="nyhet.pubDate._text">
                        <td>{{nyhet.pubDate._text}}</td>
                        <td>{{nyhet.title._text}}</td>
                        <td>{{nyhet.description._text}}</td>
                        <td><a :href="nyhet.link._text"> Les Nyhet </a></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
            </div>
    </div>
</template>

<script>
import axios from 'axios';
import convert from 'xml-js';

const API = 'http://localhost:8000'

    export default {

        data() {
          return {
            artikler: [],
            loading: true,
          }
        },

        mounted() {
            this.getArtikler();
        },

        methods: {
          async getArtikler() {
            let data = await axios.get(`${API}/artikler`);
            let xml = data.data;
            let converted = convert.xml2json(xml, {compact: true, spaces: 4});
            let json = JSON.parse(converted);
            this.artikler = json['rss']['channel']['item'];
            // this.loading = false;

          },


        }




    }
</script>
