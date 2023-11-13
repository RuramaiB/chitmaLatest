<template>
    <NuxtLayout name="financial-targets-layout">
      <div class="mt-1 p-4 gap-3">
        <div class="bg-white rounded shadow-sm">
          <div class="flex justify-between">
                <div class="flex flex-row justify-between">
                <div class="mb-4">
                  <label  for="descriptionFilter" class="block font-medium mb-1">Filter by description:</label>
                  <select v-if="!loading" v-model="descriptionFilter" id="descriptionFilter" class="border border-gray-300 rounded-md px-4 py-2 w-full">
                    <option value="">All</option>
                    <option v-for="desc in descriptionsData" :value="desc">{{ desc }}</option>
                  </select>
                </div>
                <div class="mb-4 ml-5">
                  <label for="targetFilter" class="block font-medium mb-1">Filter by Target:</label>
                  <input
                    v-model="targetFilter"
                    id="targetFilter"
                    type="text"
                    class="border border-gray-300 rounded-md px-4 py-2 w-full"
                    placeholder="Search target..."
                  />
                </div>
              </div>
                  <div>
                    
                    <button class="text-black border-2 border-blue-600 bg-white px-4 py-1 rounded-lg m-1" @click="openAddModal">Allocate</button>
                    <button class="text-black border-2 border-blue-600 bg-white px-4 py-1 rounded-lg m-1" @click="openAddModal">Reset</button>
                  </div>
              </div>
         
        </div>
                <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-white uppercase bg-blue-900 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                              <th scope="col" class="px-6 py-3">
                                ID
                            </th>
                                <th scope="col" class="px-6 py-3">
                                  Description
                                </th>
                                <th scope="col" class="px-6 py-3">
                                  Target
                                </th>
                                <th scope="col" class="px-6 py-3">
                                  Level
                                </th>
                                <th scope="col" class="px-6 py-3">
                                  Amount
                                </th>
                                <th scope="col" class="px-3 py-3"></th>
                            </tr>
                        </thead>
                        <tbody v-if="!loading">
                            <tr v-for="item in filteredItems" :key="item.id" class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                              <td class="px-6 py-4">{{ item.id }}</td>
                              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                {{ item.financeDescription.description }}
                            </th>
                              <td class="px-6 py-4">{{ item.target}}</td>
                              <td class="px-6 py-4">{{ item.level}}</td>
                              <td class="px-6 py-4">{{ item.amount}}</td>
                              <td class="px-3 py-4">
                                <a href="#" class="font-medium text-green-500 dark:text-blue-500 hover:underline">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"   class="bi bi-pencil-square" viewBox="0 0 16 16"> <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/> <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/> </svg>
                                </a >
                              </td>
                            </tr>
                        </tbody>
                    </table>
                    <div v-if="!loading" class="text-md text-white flex flex-row justify-end bg-blue-900 px-8 w-full">
                          <button class="p-3" @click="getAllFinancialTargets(pageNumber)"  v-for="pageNumber in result.totalPages" :key="pageNumber">
                            {{ pageNumber }} 
                          </button>
                    </div>
                </div>               
                <div v-if="deleteModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-10">
                  <div class="bg-white p-6 rounded-lg">
                    <p class="mb-4">Are you sure you want to delete?</p>
                    <div class="flex justify-end">
                      <button class="mr-2 px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded" @click="handleOption('yes')">Yes</button>
                      <button
                        class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 rounded" @click="handleOption('no')">No</button>
                    </div>
                  </div>
                </div>
               
      </div>  
    </NuxtLayout>
      
  </template>
  
  <script>
  import axios from 'axios'
  import { encryptData, decryptData } from '@/encryption';
  export default {
    data() {
      return {
        descriptionFilter: '',
        targetFilter: '',
        addModal: false,
        editModal: false,
        deleteModal: false,
        editModalHeading: 'Edit record',
        addModalHeading: 'Add new finance description',
        loading:true,
        isOpen: false,
        name: '',
        person:'',
        item: [],
        errors: {},
        targets: {
          description: '',
          status: [],
          local: '',
        },
        locs:[],
        items: [{
          id: '',
          description: '',
          status: [],
          local: '',
      }],
      pages:[],
      result:[],
      };
    },
    computed: {
      filteredItems() {
        let filteredItems = this.items;
  
        if (this.descriptionFilter) {
          filteredItems = filteredItems.filter((item) => item.financeDescription.description === this.descriptionFilter);
        }
  
        if (this.targetFilter) {
          filteredItems = filteredItems.filter(
            (item) => item.target.toLowerCase().includes(this.targetFilter.toLowerCase())
          );
        }
  
        return filteredItems;
      },
      descriptionsData() {
        return [...new Set(this.items.map((item) => item.financeDescription.description ))];
      },
    },
    methods:{
      async getAllFinancialTargets(pageNumber){
      this.loading = true;
      Number.parseInt(pageNumber)
      pageNumber -=1;
      const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
      const URL = `https://chitma.hushsoft.co.zw/api/financialTargets/getAllFinancialTargetsByLocal/${local}/${pageNumber}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.result = res.data
        this.items = res.data.content
        this.pages = res.data.pageable
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async addFinancialTarget(){
              this.errors = {};
              if(!this.targets.target){
                  this.errors.target = "Financial Target is required";
              }
              if(!this.targets.financialDescription){
                  this.errors.financialDescription = "Financial Description is required";
              }  
              if(!this.targets.level){
                  this.errors.level = "Financial Level is required";
              }
              if (Object.keys(this.errors).length === 0) {
          // make API call or submit form data here
          try{
            const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
          await axios.post('https://chitma.hushsoft.co.zw/api/financeDescription/addNewFinanceDescriptions',{
            'description': this.targets.description,  
            'status': this.targets.status,
            'local': local,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Finance Description added successfully.")
            this.closeAddModal()
            reloadNuxtApp()
            this.response = data;
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
        }
      },
     async handleOption (_option) {
        if(_option = 'yes'){
          try{
          await axios.delete('https://chitma.hushsoft.co.zw/api/local/deleteLocalPreachingPointByName/' + this.name,{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Local Finance Record deleted successfully.")
            this.closeDeleteModal()
            reloadNuxtApp()
            this.response = data;
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
      }
      else if(_option = 'no'){
        this.name = ''
        this.closeDeleteModal();
      } 
      },
      async getAdminInfo(){
      this.loading = true;
      const mN = localStorage.getItem('mN');
      const mbnD = decryptData(mN);
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getUserByMembershipNumber/${mbnD}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.adminInfo = res.data
        this.user = this.adminInfo
        this.person = this.user.firstname
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
        openAddModal() {
          this.addModal = true;
        },
        closeAddModal() {
          this.addModal = false;
        },
        openEditModal() {
          this.editModal = true;
        },
        closeEditModal() {
          this.editModal = false;
        },
        openDeleteModal(name) {
          this.deleteModal = true;
          this.name = name;
        },
        closeDeleteModal() {
          this.deleteModal = false;
        },
       
    },
    mounted(){
      this.getAllFinancialTargets(1)
      this.getAdminInfo()
    }
  };
  </script>
  
  <style>
  
  </style>
  
  