<form action="SearchServlet" method="post">

    <h3>Select Service</h3>

    <select name="service" required style="width:100%; padding:10px; margin-bottom:10px;">
        <option value="">-- Select Service --</option>
        <option value="plumber">Plumber</option>
        <option value="electrician">Electrician</option>
        <option value="mechanic">Mechanic</option>
        <option value="doctor">Doctor</option>
        <option value="carpenter">Carpenter</option>
    </select>

    <input type="text" name="village" placeholder="Enter Village Name" required 
           style="width:100%; padding:10px; margin-bottom:10px;">

    <button type="submit" style="width:100%; padding:10px; background:#0072ff; color:white;">
        Search
    </button>

</form>