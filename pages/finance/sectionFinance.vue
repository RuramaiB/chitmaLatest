<template>
     <NuxtLayout name="finance-layout">
    <div class="flex px-10 py-1 bg-blue-900 lg:w-full md:w-screen">    
        <div class="flex flex-rows w-full justify-between">
          <div class="pl-1 py-2">
            <h1 class="text-xl font-semibold text-white">Section Finance</h1>
          </div>
          <!-- Right content -->
          <div class="relative my-1 z-10">
          <button
          v-if="!loading"
            @click="isOpen = !isOpen"
            class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
            aria-expanded="false"
          >
            {{ this.person }}
            <svg
              class="-mr-1 ml-2 h-5 w-5"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
              fill="currentColor"
              aria-hidden="true"
            >
              <path
                fill-rule="evenodd"
                d="M6 8l4 4 4-4H6z"
                clip-rule="evenodd"
              ></path>
            </svg>
          </button>
          <div
            v-if="isOpen"
            class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
            role="menu"
            aria-orientation="vertical"
            aria-labelledby="options-menu"
          >
            <div class="py-1 px-2" role="none">
              <!-- Dropdown options -->
              <NuxtLink class=" text-black flex flex-cols text-md font-lg cursor-pointer my-3 gap-2" to="/">
                <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 24 24"> <g> <path fill="none" d="M0 0h24v24H0z"/> <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2a9.985 9.985 0 0 1 8 4h-2.71a8 8 0 1 0 .001 12h2.71A9.985 9.985 0 0 1 12 22zm7-6v-3h-8v-2h8V8l5 4-5 4z"/> </g> </svg>
                Logout
              </NuxtLink>
            </div>
          </div>
        </div>
          
        </div>
    </div>
  <div class="mt-5 p-4 gap-3 lg:w-full md:w-screen">
      <div class=" p-4 bg-white rounded shadow-sm">
              <div class="flex justify-between">
                <div class="flex flex-row justify-between">
                <div class="mb-4">
                  <label for="sectionFilter" class="block font-medium mb-1">Filter by Section:</label>
                  <select v-model="sectionFilter" id="sectionFilter" class="border border-gray-300 rounded-md px-4 py-2 w-full">
                    <option value="">All</option>
                    <option v-for="section in sections" :value="section">{{ section }}</option>
                  </select>
                </div>
            
                <div class="mb-4 ml-5">
                  <label for="surnameFilter" class="block font-medium mb-1">Filter by Surname:</label>
                  <input
                    v-model="surnameFilter"
                    id="surnameFilter"
                    type="text"
                    class="border border-gray-300 rounded-md px-4 py-2 w-full"
                    placeholder="Search section..."
                  />
                </div>
              </div>
                  <div>
                    <!-- Add Button -->
                    <button class="text-black border-2 border-blue-600 bg-white px-4 py-1 rounded-lg m-1" @click="openAddModal">Add</button>
                    <button class="text-black border-2 border-blue-600 bg-white px-4 py-1 rounded-lg m-1" @click="exportToExcel">Export</button>
                                 
                    <!-- Modal -->
                    <div v-if="showAddModal" class="z-10 pt-5 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                      <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                        <!-- Modal Content -->
                        <div class="flex justify-between">
                          <h2 class="text-2xl font-bold mb-4">{{ addModalHeading }}</h2>
                          <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeAddModal">X</button>
                        </div>
                        <p v-if="loading">Processing the payment request</p>
                        <form v-else @submit.prevent="addSectionFinanceSubmit()" class=" grid grid-cols-3 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                          <!-- Membership Number -->
                          <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="membershipNumber">Membership Number:</label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                              id="membershipNumber" type="text" v-model="payments.membershipNumber">
                              <p v-if="this.errors.membershipNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.membershipNumber}}</p>
                          </div>
                          <!-- Section -->
                          <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="section">Section:</label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                              id="section" type="text" v-model="payments.section">
                              <p v-if="this.errors.section" class="text-sm text-red-600 text-left mb-2">*{{this.errors.section}}</p>
                          </div>
                          <!-- Description -->
                          <div class="mb-4">
                            <label for="sectionFilter" class="block font-medium mb-1">Description:</label>
                            <select v-model="payments.description" id="sectionFilter" class="border border-gray-300 rounded-md px-4 py-2 w-full">
                              <option v-for="fd in financeDesc" :value="fd">{{ fd }}</option>
                            </select>
                            <p v-if="this.errors.description" class="text-sm text-red-600 text-left mb-2">*{{this.errors.description}}</p>
                          </div>
                        <!-- End of Description -->
                          <!-- Payment Method -->
                          <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="paymentMethod">Payment Method:</label>
                            <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                              id="paymentMethod" v-model="payments.paymentMethod" required>
                              <option value="" disabled>Select payment method</option>
                              <option value="cash">Cash</option>
                              <!-- <option value="Ecocash">Ecocash</option>
                              <option value="Onemoney">OneMoney</option> -->
                            </select>
                            <p v-if="this.errors.paymentMethod" class="text-sm text-red-600 text-left mb-2">*{{this.errors.paymentMethod}}</p>
                          </div>      
                       <!-- Phone Number -->
                          <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="description">Phone Number:</label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                              id="phoneNumber" type="text" v-model="payments.phoneNumber">
                              <p v-if="this.errors.phoneNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.phoneNumber}}</p>
                            </div>
                          <!-- Currency -->
                          <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="currency">Currency:</label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                              id="currency" type="text" v-model="payments.currency">
                              <p v-if="this.errors.currency" class="text-sm text-red-600 text-left mb-2">*{{this.errors.currency}}</p>
                          </div>  
                          <!-- Amount -->
                          <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="amount">Amount:</label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                              id="amount" type="text" v-model="payments.amount">
                              <p v-if="this.errors.amount" class="text-sm text-red-600 text-left mb-2">*{{this.errors.amount}}</p>
                          </div>  
                          <!-- Submit Button -->
                          <div class="ml-2">
                            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                              type="submit">Submit</button>
                          </div>
                        </form>   
                      </div>
                    </div>
                  </div>
              </div>  
              
              <div class="relative overflow-x-auto shadow-md sm:rounded-lg lg:w-full md:w-full">
                  <table class="lg:w-full md:w-screen text-sm text-left text-gray-500 dark:text-gray-400">
                      <thead class="text-xs text-white uppercase bg-blue-900 dark:bg-gray-700 dark:text-gray-400">
                          <tr>
                              <th scope="col" class="px-4 py-3">
                                Finance ID
                              </th>
                              <th scope="col" class="px-4 py-3">
                                  Date Of Payment
                              </th>
                              <th scope="col" class="px-4 py-3">
                                  Section
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Membership Number
                            </th>
                              <th scope="col" class="px-4 py-3">
                                  Name
                              </th>
                              <th scope="col" class="px-4 py-3">
                                  Surname
                              </th>
                              <th scope="col" class="px-4 py-3">
                               Phone Number
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Currency
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Payment Method
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Description
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Amount
                              </th>
                              <th scope="col" class="px-4 py-3">
                                
                              </th>
                               <th scope="col" class="px-4 py-3">
                              </th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr v-for="item in filteredItems" :key="item.id" class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                            <td class="px-6 py-4">{{ item.financeID}}</td>
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                              {{ item.dateOfPayment }}
                          </th>
                            <td class="px-4 py-4">{{ item.section.name}}</td>
                            <td class="px-4 py-4">{{ item.membershipNumber}}</td>
                            <td class="px-4 py-4">{{ item.user.firstname }}</td>
                            <td class="px-4 py-4">{{ item.user.lastname }}</td>
                            <td class="px-4 py-4">{{ item.phoneNumber}}</td>
                            <td class="px-4 py-4">{{ item.currency}}</td>
                            <td class="px-4 py-4">{{ item.paymentMethod }}</td>
                            <td class="px-4 py-4">{{ item.financeDescription.description }}</td>
                            <td class="px-4 py-4">{{ item.amount }}</td>
                            <td class="px-3 py-4">
                                <a href="#" class="font-medium text-green-500 dark:text-blue-500 hover:underline">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  @click="fetchSectionFinanceByID(item.financeID)"  class="bi bi-pencil-square" viewBox="0 0 16 16"> <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/> <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/> </svg>
                                </a >
                            </td>
                          <td class="pl-3 pr-4 py-4">
                            <a href="#" class="font-medium text-yellow-500 dark:text-blue-500 hover:underline" >
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  @click="openDeleteModal(item.financeID)" class="bi bi-trash" viewBox="0 0 16 16"> <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/> <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/> </svg>
                            </a >
                          </td>
                          </tr>
                      </tbody>
                  </table>
                  <div v-if="!loading" class="text-md text-white flex flex-row justify-end bg-blue-900 px-8 lg:w-full md:w-screen">
                        
                        <button class="p-3" @click="fetchSectionFinance(pageNumber)"   v-for="pageNumber in this.result.totalPages" :key="pageNumber">
                          {{ pageNumber }} 
                        </button>
                  </div>
              </div>
              <div v-if="editModal" class="z-10 pt-5 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                  <!-- Modal Content -->
                  <div class="flex justify-between">
                    <h2 class="text-2xl font-bold mb-4">{{ editModalHeading }}</h2>
                    <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeEditModal">X</button>
                  </div>
                  <p v-if="loading">Processing the payment request</p>
                  
                  <form v-else @submit.prevent="updateSectionFinanceSubmit(finance.financeID)" class=" grid grid-cols-3 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                    <!-- Membership Number -->
                    <div class="mb-4">
                      <label class="block text-gray-700 text-sm font-bold mb-2" for="membershipNumber">Membership Number:</label>
                      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        id="membershipNumber" type="text" v-model="finance.membershipNumber">
                        <p v-if="this.errors.membershipNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.membershipNumber}}</p>
                    </div>
                    <!-- Section -->
                    <div class="mb-4">
                      <label class="block text-gray-700 text-sm font-bold mb-2" for="section">Section:</label>
                      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        id="section" type="text" v-model="finance.section.name">
                        <p v-if="this.errors.section" class="text-sm text-red-600 text-left mb-2">*{{this.errors.section}}</p>
                    </div>
                <!-- Description -->
                <div class="mb-4">
                            <label for="sectionFilter" class="block font-medium mb-1">Description:</label>
                            <select v-model="finance.description" id="sectionFilter" class="border border-gray-300 rounded-md px-4 py-2 w-full">
                              <option v-for="fd in financeDesc" :value="fd">{{ fd }}</option>
                            </select>
                            <p v-if="this.errors.description" class="text-sm text-red-600 text-left mb-2">*{{this.errors.description}}</p>
                          </div>
                <!-- End of Description -->
                    <!-- Payment Method -->
                    <div class="mb-4">
                      <label class="block text-gray-700 text-sm font-bold mb-2" for="paymentMethod">Payment Method:</label>
                      <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        id="paymentMethod" v-model="finance.paymentMethod" required>
                        <option value="" disabled>Select payment method</option>
                        <option value="cash">Cash</option>
                        <!-- <option value="Ecocash">Ecocash</option>
                        <option value="Onemoney">OneMoney</option> -->
                      </select>
                      <p v-if="this.errors.paymentMethod" class="text-sm text-red-600 text-left mb-2">*{{this.errors.paymentMethod}}</p>
                    </div>      
                 <!-- Phone Number -->
                    <div class="mb-4">
                      <label class="block text-gray-700 text-sm font-bold mb-2" for="description">Phone Number:</label>
                      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        id="phoneNumber" type="text" v-model="finance.phoneNumber">
                        <p v-if="this.errors.phoneNumber" class="text-sm text-red-600 text-left mb-2">*{{this.errors.phoneNumber}}</p>
                      </div>
                    <!-- Currency -->
                    <div class="mb-4">
                      <label class="block text-gray-700 text-sm font-bold mb-2" for="currency">Currency:</label>
                      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        id="currency" type="text" v-model="finance.currency">
                        <p v-if="this.errors.currency" class="text-sm text-red-600 text-left mb-2">*{{this.errors.currency}}</p>
                    </div>  
                    <!-- Amount -->
                    <div class="mb-4">
                      <label class="block text-gray-700 text-sm font-bold mb-2" for="amount">Amount:</label>
                      <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                        id="amount" type="text" v-model="finance.amount">
                        <p v-if="this.errors.amount" class="text-sm text-red-600 text-left mb-2">*{{this.errors.amount}}</p>
                    </div>  
                    <!-- Submit Button -->
                    <div class="ml-2">
                      <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                        type="submit">Submit</button>
                    </div>
                  </form>     
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
  </div>
</NuxtLayout>  
</template>

<script>
import axios from 'axios'
import * as XLSX from 'xlsx/xlsx.mjs';
import { encryptData, decryptData } from '@/encryption';
export default {
  data() {
    return {
      sectionFilter: '',
      surnameFilter: '',
      items: [],
      showAddModal: false,
      editModal: false,
      deleteModal: false,
      FID: '',
      addModalHeading: 'Add new record',
      editModalHeading: 'Edit record',
      loading:true,
      person: '',
      finance:[],
      payments: {
          description: '',
          amount: '',
          phoneNumber: '',
          paymentMethod: '',
          membershipNumber: '',
          currency: '',
          section:'',
          locals:'St Andrews',
          
        },
        errors:[],
        pages:[],
        result:[]
    };
  },
  computed: {
    filteredItems() {
      let filteredItems = this.items;

      if (this.sectionFilter) {
        filteredItems = filteredItems.filter((item) => item.section.name === this.sectionFilter);
      }

      if (this.surnameFilter) {
        filteredItems = filteredItems.filter(
          (item) => item.user.lastname.toLowerCase().includes(this.surnameFilter.toLowerCase())
        );
      }

      return filteredItems;
    },
    sections() {
      return [...new Set(this.items.map((item) => item.section.name))];
    },
    financeDesc() {
      return [...new Set(this.financeDescription.map((item) => item.description))];
    }
  },
  methods:{
    async fetchSectionFinance(pageNumber){
    this.loading = true;
    Number.parseInt(pageNumber)
    pageNumber -=1;
    const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
    const URL = `https://chitma.hushsoft.co.zw/api/sectionFinance/getSectionFinanceByLocal/${local}/${pageNumber}`;
    const token = localStorage.token;
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
    async fetchSectionFinanceByID(id){
          this.loading = true;
    const URL = `https://chitma.hushsoft.co.zw/api/sectionFinance/getSectionFinanceByFinanceID/${id}`;
    // const token = localStorage.token;
    await axios.get(URL,{
      headers: {'Content-Type': 'application/json',
          // Authorization : 'Bearer ' + token,
          'Access-Control-Allow-Origin': '*'}
    }).then((res) =>
     {
      this.finance = res.data
      this.editModal = true;
    }) .catch(error => {
      console.log(error.code)
      this.error=error.code;
      this.errored = true

    }).finally(() => this.loading = false);
    },
    async addSectionFinanceSubmit(){
            this.errors = {};
            if(!this.payments.membershipNumber){
                this.errors.membershipNumber = "Membership number is required";
            }
            if(!this.payments.amount){
                this.errors.amount = "Amount is required";
            }
            if(!this.payments.paymentMethod){
                this.errors.paymentMethod = "Payment method is required";
            }
            if(!this.payments.currency){
                this.errors.currency = "Currency is required";
            }   
            if(!this.payments.phoneNumber){
                this.errors.phoneNumber = "Phone number is required";
            } 
            if(!this.payments.description){
                this.errors.description = "Description is required";
            }         
            // if(!this.payments.section){
            //     this.errors.section = "Section is required";
            // }
            if (Object.keys(this.errors).length === 0) {
        // make API call or submit form data here
        try{
          const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
        await axios.post('https://chitma.hushsoft.co.zw/api/sectionFinance/addSectionFinance',{
          'amount': this.payments.amount,  
          'phoneNumber': this.payments.phoneNumber,
          'paymentMethod': this.payments.paymentMethod,
          'membershipNumber': this.payments.membershipNumber,
          'currency': this.payments.currency,
          'local': local,
          'description': this.payments.description,
          'section': this.payments.section
        },{
            headers: {'Content-Type': 'application/json'},
            credentials: 'include'
          }).then((response) =>{
          const data = response.data;
          alert("Section Finance Record added successfully.")
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
    async handleOption(_option) {
      if(_option = 'yes'){
        try{
        await axios.delete('https://chitma.hushsoft.co.zw/api/sectionFinance/deleteSectionFinanceByFinanceID/' + this.FID,{
            headers: {'Content-Type': 'application/json'},
            credentials: 'include'
          }).then((response) =>{
          const data = response.data;
          alert("Section Finance Record deleted successfully.")
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
      this.FID = ''
      this.closeDeleteModal();
    } 
    },
    async updateSectionFinanceSubmit(id){
            this.errors = {};
            if(!this.finance.membershipNumber){
                this.errors.membershipNumber = "Membership number is required";
            }
            if(!this.finance.amount){
                this.errors.amount = "Amount is required";
            }
            if(!this.finance.paymentMethod){
                this.errors.paymentMethod = "Payment method is required";
            }
            if(!this.finance.currency){
                this.errors.currency = "Currency is required";
            }   
            if(!this.finance.phoneNumber){
                this.errors.phoneNumber = "Phone number is required";
            } 
            if(!this.finance.description){
                this.errors.description = "Description is required";
            }         
            if(!this.finance.section){
                this.errors.section = "Section is required";
            }       
           
            if (Object.keys(this.errors).length === 0) {
        // make API call or submit form data here
        try{
          const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
        await axios.put(`https://chitma.hushsoft.co.zw/api/sectionFinance/updateSectionFinanceByFinanceID/${id}`,{
          'amount': this.finance.amount,  
          'phoneNumber': this.finance.phoneNumber,
          'paymentMethod': this.finance.paymentMethod,
          'membershipNumber': this.finance.membershipNumber,
          'currency': this.finance.currency,
          'local': local,
          'description': this.finance.description,
          'section': this.finance.section.name
        },{
            headers: {'Content-Type': 'application/json'},
            credentials: 'include'
          }).then((response) =>{
          const data = response.data;
          alert("Section finance updated successfully.")
          this.closeEditModal()
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
    async getAllFinanceDescriptions(){
    this.loading = true;
    const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
    const URL = `https://chitma.hushsoft.co.zw/api/financeDescription/getAllFinanceDescriptions/${local}`;
    const token = localStorage.token;
    await axios.get(URL,{
      headers: {'Content-Type': 'application/json',
          // Authorization : 'Bearer ' + token,
          'Access-Control-Allow-Origin': '*'}
    }).then((res) =>
     {
      this.financeDescription = res.data;
    }) .catch(error => {
      console.log(error.code)
      this.error=error.code;
      this.errored = true

    }).finally(() => this.loading = false);
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
      async exportToExcel() {
        try {
          const pp = localStorage.getItem('pp');
          const local = decryptData(pp);

          const response = await axios.get(`https://chitma.hushsoft.co.zw/api/sectionFinance/getSectionFinanceBy/${local}`);
          const users = response.data;
          const columnNames = ['ID', 'Date of Payment', 'Name', 'Surname', 'Membership Number', 'Section','Phone Number', 'Payment Method','Currency', 'Description', 'Amount']; // Replace with your actual column names
          const columnValues = users.map((payee) => [
           payee.financeID,
           payee.dateOfPayment,
           payee.user.firstname,
           payee.user.lastname,
           payee.membershipNumber,
           payee.section.name,
           payee.phoneNumber,
           payee.paymentMethod,
           payee.currency,
           payee.financeDescription.description,
           payee.amount,
          ]);

          const worksheet = XLSX.utils.aoa_to_sheet([columnNames, ...columnValues]);
          const workbook = XLSX.utils.book_new();
          XLSX.utils.book_append_sheet(workbook, worksheet, 'Section Finance Records');

          const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });
          const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
          const fileName = 'sectionFinanceRecords.xlsx';

          if (navigator.msSaveBlob) {
            navigator.msSaveBlob(blob, fileName);
          } else {
            const link = document.createElement('a');
            if (link.download !== undefined) {
              const url = URL.createObjectURL(blob);
              link.setAttribute('href', url);
              link.setAttribute('download', fileName);
              link.style.visibility = 'hidden';
              document.body.appendChild(link);
              link.click();
              document.body.removeChild(link);
            }
          }
        } catch (error) {
          console.error(error);
        }
      },
    openAddModal() {
        this.showAddModal = true;
      },
      closeAddModal() {
        this.showAddModal = false;
      },
      openEditModal() {
        this.editModal = true;
  },
  closeEditModal() {
        this.editModal = false;
  },
  openDeleteModal(id) {
        this.deleteModal = true;
        this.FID = id;
  },
  closeDeleteModal() {
        this.deleteModal = false;
  },
  }, mounted(){
    this.fetchSectionFinance(1),
    this.getAllFinanceDescriptions(),
    this.getAdminInfo()
  }
};
</script>

<style>

</style>

