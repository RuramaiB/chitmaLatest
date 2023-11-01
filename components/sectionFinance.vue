<template>
    <form class=" grid grid-cols-3 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
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
      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="section">Section:</label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
          id="description" type="text" v-model="paymentForm.section" required>
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
          section:''
        },
      };
    },
  };
  </script>
  
  <style scoped>
  /* Add custom styling here if needed */
  </style>
  