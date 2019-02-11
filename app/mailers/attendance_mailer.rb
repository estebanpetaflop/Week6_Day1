class AttendanceMailer < ApplicationMailer

    default from: 'no-reply@monsite.fr'

   def attendance_email(attendance)
     #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
     @attendance = attendance

     # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
     mail(to: @attendance.organiser.email, subject: 'Vous avez un nouveau participant à votre évènement!')
   end
  end
