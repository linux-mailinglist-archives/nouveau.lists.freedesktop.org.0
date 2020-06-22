Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6509203F66
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 20:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96356E8B2;
	Mon, 22 Jun 2020 18:45:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from filter01nm-vif3.se.isp-net.nl (filter01nm-vif3.se.isp-net.nl
 [82.215.18.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4A16E8B2
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 18:45:14 +0000 (UTC)
Received: from smtp01.zonnet.isp-net.nl ([217.149.195.12])
 by filter01nm.se.isp-net.nl with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <jjhdiederen@zonnet.nl>)
 id 1jnRRP-0000y7-QB; Mon, 22 Jun 2020 20:45:13 +0200
Received: from roundcube (webmail03.zonnet.isp-net.nl [217.149.195.10])
 (Authenticated sender: jjhdiederen)
 by smtp01.zonnet.isp-net.nl (Postfix) with ESMTPA id 45616210E8;
 Mon, 22 Jun 2020 20:45:10 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 22 Jun 2020 20:45:10 +0200
From: Jeroen Diederen <jjhdiederen@zonnet.nl>
To: Ilia Mirkin <imirkin@alum.mit.edu>
In-Reply-To: <CAKb7Uvjh6eRpGTEuTcOHrESe9b3Zf-qMoyZBBQMcQVhwmVCQXg@mail.gmail.com>
References: <abb79c7114a58cf5b31542009531897c@zonnet.nl>
 <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ@mail.gmail.com>
 <45fa1029cf5f0610e4a3e1d65bb26b32@zonnet.nl>
 <CAKb7UviLWdO6Tm2ya7XFSGVLex_3rduM6Mxj-DFx-CZ+mksnoQ@mail.gmail.com>
 <6791f595dde33af22ef22165bcc643da@zonnet.nl>
 <CAKb7Uvjh6eRpGTEuTcOHrESe9b3Zf-qMoyZBBQMcQVhwmVCQXg@mail.gmail.com>
Message-ID: <2487a3fea31084683f2ae5b4b044ce24@zonnet.nl>
X-Sender: jjhdiederen@zonnet.nl
User-Agent: Roundcube Webmail/1.3.9
X-Originating-IP: 217.149.195.12
X-SpamExperts-Domain: zonnet.nl
X-SpamExperts-Username: 217.149.195.12
Authentication-Results: se.isp-net.nl;
 auth=pass smtp.auth=217.149.195.12@zonnet.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0f6LF1GdvkEexklpcFpSF5apSDasLI4SayDByyq9LIhVorQ/nuCV0hRl
 CpCZXiLuSUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Ku5se/blNASm5b8HeWDvys6XR
 YZQxrmou6NLq1+4mP1IIiSK1+OndoICHCLqvAlonBP7yI+rqem1U0vJTYcAY8YQwqwvoK/JD/U0z
 Hr2F9KMEybI1sOftHmSKUCHCvcq0TzZjnkrrL1mACMw/UF0G0V/RKjiWqmC6Vi1UgXMG7ngUOled
 bu+r9+W9cDXvzL3S7Dg9elpePv2xEEErBdrvnGvfAPllJ3YdM9ixxrKuYCdNxaypTbp28NxghjNo
 pU/Oaqj4KISIRSJ5MfjE8OaunZEyYYf7TmlI3iEcqXK4A61ChHMQHCMEWTX9HEhwSP4/MSl+mev0
 M9cO0xP2892D0f1vGs+oFsetd7z62kYIphyzRu9XsALc0Y4fkqZLUhxXi2+ZrpvcQF0mktyij7U2
 V1mYqffhoXnZj6JC/A974b0O3b4FxtST7HIdO8DRlV5pSS/+Eq9W1Ne6bh1TgoOk8CjnSpaOixcY
 U6peM+R49yXm+ifPs2yIXVaS7j1CpD4sbMC/K6klzbRMjzrXH/SDfWiH1Wgh6RAenBR+licROGbR
 bL3XEliUM9W1ZU04ovLnwi5FRJMEzAJRlt0fWJ8WszvoneYamto5b4GQAI+GTjJXowrwswz4+8bs
 wNusDSzXHG971kKzKZS34Z+yCQ5bVSz3XgtqLDENrnN+u7byfLqgZZAS9m5ZAKg1qGreZOdF9IP+
 yzYJsLYmJ+6/9gBPvABAjEnKdWzW+F3p1pUhf5xQWieK01OBEUFBjx1xlIOBfVrQw/ik1GmQWr3x
 iU7EK1FfEoXm0/FPF8PR0w363lnIDcXy6rgl7s7LXJlobqWDnZ0am9RvkISTKpGN4QIbOj1kMcZY
 3r4uvsbY2LkaCy40NNvNfQ7HmekZAHkDEtV8ELH1utqYxpVVHJUK1MCC1wGyAMas+HCc9VkJt8qX
 JFmN6oO4CfHUSlMQ8/zY1Kg2ePQ44lqMDpyryPGheI8wLgY2GlHJUyuLXDtGnG9KEyM=
X-Report-Abuse-To: spam@master01nm.se.isp-net.nl
Subject: Re: [Nouveau] nouveau on G5 Macs
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I see libwayland packages installed.

Ilia Mirkin schreef op 2020-06-22 20:18:
> OK. That's not tearing. That's like a bad pitch on an image.
> (Presumably you only find the second image, IMG_1968.jpg,
> problematic?)
> 
> I'm guessing you're using a GL-based compositor, which I fully expect
> to work poorly. Please try a non-compositing or XRender-based
> compositing environment.
> 
> Cheers,
> 
>   -ilia
> 
> On Mon, Jun 22, 2020 at 2:15 PM Jeroen Diederen <jjhdiederen@zonnet.nl> 
> wrote:
>> 
>> This is with 64k page size.
>> 
>> 
>> 
>> Ilia Mirkin schreef op 2020-06-22 19:27:
>> > I suspect screen tearing (as it's usually defined) is to be expected.
>> > Can you take a photo of what you're seeing, since I'm suspecting it's
>> > more than regular screen tearing?
>> >
>> > On Mon, Jun 22, 2020 at 12:08 PM Jeroen Diederen
>> > <jjhdiederen@zonnet.nl> wrote:
>> >>
>> >> Hi Ilia,
>> >>
>> >> I experience screen tearing for both 64k and 4k page size.
>> >> My iMac G5 has an nVidia Geforce FX 5200 Ultra GPU.
>> >>
>> >> Regards,
>> >> Jeroen
>> >>
>> >>   Ilia Mirkin schreef op 2020-06-22 17:25:
>> >> > Which GPU do you have? The NV40 AGP board (GeForce 6800) works
>> >> > particularly poorly. However as long as you go with 4k pages (and
>> >> > there's no real benefit to 64k pages for most applications), basic
>> >> > things should work. I wouldn't recommend using a GL-based compositor
>> >> > though.
>> >> >
>> >> > Which distortion are you talking about?
>> >> >
>> >> > Cheers,
>> >> >
>> >> >   -ilia
>> >> >
>> >> > On Mon, Jun 22, 2020 at 11:10 AM Jeroen Diederen
>> >> > <jjhdiederen@zonnet.nl> wrote:
>> >> >>
>> >> >> Hi all,
>> >> >>
>> >> >> I have been trying to solve nouveau issues on my iMac G5 for ages. As
>> >> >> far as I can understand it, there is a problem with nouveau and page
>> >> >> size mapping. I tried both 64K and 4K page size kernels and the the
>> >> >> result is always distorted video.
>> >> >> There is an old To-Do list, which says "fix the page size mapping
>> >> >> problem on G5/64 bit for exposing fifo regs" on
>> >> >> https://nouveau.freedesktop.org/wiki/ToDo/.
>> >> >>
>> >> >> Is there any chance that this bug will be fixed ? I am not a
>> >> >> programmer,
>> >> >> so I can't be of any help.
>> >> >>
>> >> >> Jeroen Diederen
>> >> >> _______________________________________________
>> >> >> Nouveau mailing list
>> >> >> Nouveau@lists.freedesktop.org
>> >> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
