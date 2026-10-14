<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	  <div class="menubar secondnav " style="background-color:white;">
    <div id="menucontent" class="container secondnav">
      <div id="collapsable-nav" class="collapse navbar-collapse hidden-lg hidden-md">
        <ul id="nav-list" class="nav navbar-nav navbar-left pull-left">
            <li id="navHomeButton">
              <a href="adminHome.jsp">
                <span class="glyphicon glyphicon-home"></span> Home</a> <!--Home button is here -->
            </li>
            <!-- <li class="dropdown">
                <a class="dropdown-toggle " data-toggle="dropdown" data-animations="fadeIn fadeInLeft fadeInUp fadeInRight" data-hover="dropdown">Vendors
                    <span class="caret"></span></a>    Dropdown under about us category
                <ul class="dropdown-menu">
                  <li><a href="viewVendor.jsp">View All Vendors</a></li>
                  <li><a href="ApproveVendor">Approve Vendors</a></li>
                  <li><a href="vendorDetail.jsp">Vendor Detail</a></li>
                </ul>
              </li> -->
              <li><a href="adminViewVendor.jsp">Vendors</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-animations="fadeIn fadeInLeft fadeInUp fadeInRight"> 
                <!--Dropdown under tender category -->
                  Tender
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="viewTender.jsp">View all Tenders</a></li>
                  <li><a href="createTender.jsp">Create New Tender</a></li>
                  <li><a href="viewTenderBids.jsp">View Tender Bids</a></li>
                  <li><a href="viewTenderBids.jsp">Accept a bid</a></li>
                  <li><a href="viewAssignedTenders.jsp">View Assigned Tenders</a></li>
                  </ul>
             </li>
             
            <li class="dropdown">
                <a class="dropdown-toggle " data-toggle="dropdown" data-animations="fadeIn fadeInLeft fadeInUp fadeInRight" data-hover="dropdown">Notice
                    <span class="caret"></span></a>    <!--Dropdown under about us category -->
                <ul class="dropdown-menu">
                  <li><a href="addNotice.jsp">Add Notice</a></li>
                  <li><a href="removeNotice.jsp">Remove Notice</a></li>
                  <li><a href="updateNotice.jsp">Update Notice</a></li>
                  <li><a href="viewNotice.jsp">View All Notice</a></li>
                </ul>
              </li>
              
             <li>
            	<a href="LogoutSrv">Logout</a>
        
            </li>
            
            <li>
              <!-- Form for searching any tenders or items-->
              <form class="navbar-form hidden-xs" action="searchTender.jsp"  >
                <div class="form-group" >
                  <input type="text" name="tid" class="form-control" placeholder="Find Tenders by name or tenderId" style="margin-left:10px;" required>
                </div>
               
                <button type="submit" class="btn btn-primary" >Search</button>
                
              </form>
              <!--End of form section-->
            </li>
        </ul>
      </div>
    </div>
  </div>