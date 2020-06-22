Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5D203C3A
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 18:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804D76E855;
	Mon, 22 Jun 2020 16:08:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from filter01asd2-vif3.se.isp-net.nl
 (filter01asd2-vif3.se.isp-net.nl [82.215.18.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63F66E855
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 16:08:43 +0000 (UTC)
Received: from smtp01.zonnet.isp-net.nl ([217.149.195.12])
 by filter01asd2.se.isp-net.nl with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <jjhdiederen@zonnet.nl>)
 id 1jnOzv-0002eW-IY; Mon, 22 Jun 2020 18:08:41 +0200
Received: from roundcube (webmail03.zonnet.isp-net.nl [217.149.195.10])
 (Authenticated sender: jjhdiederen)
 by smtp01.zonnet.isp-net.nl (Postfix) with ESMTPA id CAB5B210DE;
 Mon, 22 Jun 2020 18:08:38 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 22 Jun 2020 18:08:38 +0200
From: Jeroen Diederen <jjhdiederen@zonnet.nl>
To: Ilia Mirkin <imirkin@alum.mit.edu>
In-Reply-To: <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ@mail.gmail.com>
References: <abb79c7114a58cf5b31542009531897c@zonnet.nl>
 <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ@mail.gmail.com>
Message-ID: <45fa1029cf5f0610e4a3e1d65bb26b32@zonnet.nl>
X-Sender: jjhdiederen@zonnet.nl
User-Agent: Roundcube Webmail/1.3.9
X-Originating-IP: 217.149.195.12
X-SpamExperts-Domain: zonnet.nl
X-SpamExperts-Username: 217.149.195.12
Authentication-Results: se.isp-net.nl;
 auth=pass smtp.auth=217.149.195.12@zonnet.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0f6LF1GdvkEexklpcFpSF5apSDasLI4SayDByyq9LIhVbpZ1q5HXaP5C
 hdgvEvaAVUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Ku5se/blNASm5b8HeWDvys6XR
 YZQxrmou6NLq1+4mP1IIiSK1+OndoICHCLqvAlonBP7yI+rqem1U0vJTYcAY8cnyv2Ulo9BtsMM6
 wMQRQboEybI1sOftHmSKUCHCvcq0TzZjnkrrL1mACMw/UF0G0V/RKjiWqmC6Vi1UgXMG7ngUOled
 bu+r9+W9cDXvzL3S/mvUeDTVOHKHbXPr2qKLF8eBp/liKy/06jed5mMB0LQ+AwMXi+OSqQVvJeAt
 QeT9Q5MeWyHYFcw5tP/0jE4kl+nE6wHyAbSyVXutrqMjgFKWCIh6nwoBuMKwN8OP5EE2CsQxwPST
 fSeJOF2atdSUJGUqMyL1jn5vJcvCViG/hk8VJxfkLc5E0+9+7b1MR7he6+MR9Nol7RZuMNLAjhWw
 OH8CTlQwpHklpufi6pZ4ylXWRHXvEHpBLVtVHkwhaj7h6j3a1v9dg8utFXxc3VLreFoTbxWjWWGS
 VjIBIuoUBQ7XzXmHaN80JC+nfH561Te/6BtpbmdpMLvM58ZB4GVvZfvg7iEFLP+SSY+Av5+AiC5U
 8JvSPiVdU2r8nJ8SSdXlAkgLaBDHypM8oS2ytZStGn6UJnnG3krVDynmGeBgSGS2c0kl3EtmKpV5
 7kfRGd8VTEes0erzd/oemg8HByBjC/fQsJMjVuaCfq+S2F3DJOIRFZ4oobg8BBg3Jq+ntzj0INBJ
 O3+z2Zjz6X3wO67EB6jNTB9xtx4iHxGcpBpLDc58mAK8cc+HwSOazJD1iokr3eqQ7+boO17uS4/R
 quqLU3LYM3A6BXfvel8OEFDbU52zWvJnwRDILff73k2iqjfNzh2G7psk592IIfs9c5j9arRHhmeT
 BRqfadfBt6tkFj7YnfVcxkQa/KnWVdMRwDtiK057higznT4lSarD2MMiC9WHQ5qV2aubghe6zCmb
 Qb86aG8aakh0G/5VOXdzJ6s5ZAp92xiIzKXhTIwb/KSCogvevAJcMeWV55CJ4JlL/7cxL7hrJSk6
 0SF3F6RYOYr2
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

Hi Ilia,

I experience screen tearing for both 64k and 4k page size.
My iMac G5 has an nVidia Geforce FX 5200 Ultra GPU.

Regards,
Jeroen

  Ilia Mirkin schreef op 2020-06-22 17:25:
> Which GPU do you have? The NV40 AGP board (GeForce 6800) works
> particularly poorly. However as long as you go with 4k pages (and
> there's no real benefit to 64k pages for most applications), basic
> things should work. I wouldn't recommend using a GL-based compositor
> though.
> 
> Which distortion are you talking about?
> 
> Cheers,
> 
>   -ilia
> 
> On Mon, Jun 22, 2020 at 11:10 AM Jeroen Diederen 
> <jjhdiederen@zonnet.nl> wrote:
>> 
>> Hi all,
>> 
>> I have been trying to solve nouveau issues on my iMac G5 for ages. As
>> far as I can understand it, there is a problem with nouveau and page
>> size mapping. I tried both 64K and 4K page size kernels and the the
>> result is always distorted video.
>> There is an old To-Do list, which says "fix the page size mapping
>> problem on G5/64 bit for exposing fifo regs" on
>> https://nouveau.freedesktop.org/wiki/ToDo/.
>> 
>> Is there any chance that this bug will be fixed ? I am not a 
>> programmer,
>> so I can't be of any help.
>> 
>> Jeroen Diederen
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
