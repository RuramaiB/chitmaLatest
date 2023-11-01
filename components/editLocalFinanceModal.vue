<template>
    <div>
      <!-- Add Button -->
      <svg style="color: black; height:36px; width:36px; margin: 12px;" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" @click="openModal"><path fill="black" d="M512 64a448 448 0 1 1 0 896 448 448 0 0 1 0-896zm-38.4 409.6H326.4a38.4 38.4 0 1 0 0 76.8h147.2v147.2a38.4 38.4 0 0 0 76.8 0V550.4h147.2a38.4 38.4 0 0 0 0-76.8H550.4V326.4a38.4 38.4 0 1 0-76.8 0v147.2z"></path></svg>
  
      <!-- Modal -->
      <div v-if="showModal" class="z-10 ml-40 pt-72 absolute inset-0 flex items-center justify-center">
        <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
          <!-- Modal Content -->
          <div class="flex justify-between">
            <h2 class="text-2xl font-bold mb-4">{{ modalHeading }}</h2>
            <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeModal">X</button>
          </div>
          <form class=" grid grid-cols-4 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
            <!-- Membership Number -->
            <div class="mb-4">
              <label class="block text-gray-700 text-sm font-bold mb-2" for="membershipNumber">Membership Number:</label>
              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                id="membershipNumber" type="text" v-model="paymentForm.membershipNumber" required>
            </div>
        
            <!-- Name -->
            <div class="mb-4">
              <label class="block text-gray-700 text-sm font-bold mb-2" for="name">Name:</label>
              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                id="name" type="text" v-model="paymentForm.name" required>
            </div>
            <!-- Surname -->
            <div class="mb-4">
              <label class="block text-gray-700 text-sm font-bold mb-2" for="surname">Surname:</label>
              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                id="surname" type="text" v-model="paymentForm.surname" required>
            </div>
          <!-- Description -->
          <div class="mb-4">
                  <label class="block text-gray-700 text-sm font-bold mb-2" for="description">Description:</label>
                  <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                    id="description" type="text" v-model="paymentForm.description" required>
            </div>
            <!-- Payment Method -->
            <div class="mb-4">
              <label class="block text-gray-700 text-sm font-bold mb-2" for="paymentMethod">Payment Method:</label>
              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                id="paymentMethod" v-model="paymentForm.paymentMethod" required>
                <option value="" disabled>Select payment method</option>
                <option value="cash">Cash</option>
                <option value="ecocash">Ecocash</option>
                <option value="ecocash">OneMoney</option>
              </select>
            </div>      
         <!-- Phone Number -->
            <div class="mb-4">
              <label class="block text-gray-700 text-sm font-bold mb-2" for="description">Phone Number:</label>
              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                id="phoneNumber" type="text" v-model="paymentForm.phoneNumber" required>
              </div>
            <!-- Currency -->
            <div class="mb-4">
              <label class="block text-gray-700 text-sm font-bold mb-2" for="currency">Currency:</label>
              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                id="currency" type="text" v-model="paymentForm.currency" required>
            </div>  
            <!-- Amount -->
            <div class="mb-4">
              <label class="block text-gray-700 text-sm font-bold mb-2" for="amount">Amount:</label>
              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                id="amount" type="number" v-model="paymentForm.amount" required>
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
  </template>
  
  <script>
  export default {
    data() {
      return {
        paymentForm: {
          description: '',
          amount: null,
          phoneNumber: '',
          paymentMethod: '',
          membershipNumber: '',
          name: '',
          surname: '',
          currency: '',
        },
        showModal: false,
        modalHeading: 'Add new record',
        modalParagraph: 'This is the modal paragraph content. It can be long and scrollable.',
      };
    },
    methods: {
      openModal() {
        this.showModal = true;
      },
      closeModal() {
        this.showModal = false;
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add custom styling here if needed */
  </style>
  