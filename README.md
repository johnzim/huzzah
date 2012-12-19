Section A:

a) There are two images in the images array contained in the object. 

The overall image total, that is to say the number of images in the group which this object is addressing (probably the images which are listed as positive results to the search query,) is 39.  

b) jsonobject.images[0].users[1].name

c) Using the object in Appendix A - the code will return a null/undefined result as there is only 1 object in the users array

d) Since there's a totalImages property as well as an Offset property, it's clear that there are only 2 image objects in the image array because these are the two remaining images after skipping the first 37. Most likely this is the result of a user tabbing through multiple previous pages of images and being left with only the last two to view.

e)   - SEE DOC

f)    - SEE DOC

g) While you can work around the fact that images.sizes contains arbitrary properties it might be cleaner, particularly if there aren't always only 2 sizes, to express that as an array. 
 

Section B 

SEE GBJasonParserYo.h and .m


Section C

a)   id - it's unique

b) So the table has plenty of good stuff.

I'm assuming the MD5 Hash is used to track/check changes to the file - that would be a consideration when dealing with an image database which might be accessed by multiple end users within the same team/organisation. 

Obviously it should not be possible for a client to just ask for an image by its ID from the DB - that exchange, like just about all others, should be handled behind the API wall so that security checks can be carried out (I would assume access_level  would just check off against a user's clearance level like a ch check.)

It goes without saying that the API should make sure there's no way to throw unsanitised SQL commands into the DB (little bobby droptables.)

The API would also have to handle ownership rights over the images - users may want to upload the images privately before making them viewable for others and that may be an extra level of access checking above and beyond the standard user access level. Probably matching user id to photographer or uploader user id (is that oa_user?)

From a pure usability standpoint, being able to access things like changed md5 hashes aren't that helpful and just loads busy work onto 3rd party devs, so common tasks/requests should be amalgamated into simple calls haschanged() etc

















