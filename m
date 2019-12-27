Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5D12B4DB
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 14:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBD46E445;
	Fri, 27 Dec 2019 13:31:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E786E445
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 13:31:16 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a12so9071711uan.0
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 05:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FL9h/+KoyEZKmSeDJXbAFug6VXPK2bqSgo3SlR5J7zQ=;
 b=RHNN1eTM38M+3V4U4mtPAleN6RJY31zx8hqdt6GPCu6E8qwMC4nPWRu52YsFRJPiTq
 1TJXKAt8nZPQLciTxsCD/V3TLwhL+5k4cktM9ugoxa5BZnIiBz2wtIzKXdbCkDjQNkDA
 HQdW1+xNBBmrrs7pyLcgtujLBRmL5lpc8U+PYo72z9mblm7cELgTWzqsDmM/IWOCcADu
 3HqODF0KjIZQZBdpb+B8YklXdCRR7s2LjePVrt+nP/SUBh6h0veioUJcJBQCNUWDV4tK
 i8xQNvErOiaHnVfyzw1lfcV6IxFzw3tALl0cqS0LnSCj74+WiF7+XQxJDmgT7gtzAFQz
 mbcw==
X-Gm-Message-State: APjAAAXIuBUTginK2cjJ9o1mTszLc8ZZJF9L4ICmwinYjauIwsa55n9o
 cX0qLOD62jFsmAH6Gszyzsx3icIJCH59FPHn1NkVIc/X
X-Google-Smtp-Source: APXvYqw4Ko2cs7S2Smxn/TMrd8rCkW5D3gSQ4mloMASnr8B8RyBd2vjr3C5clQOoK5ZiIyXAWeCk+Zg8PJNbCREKM3Q=
X-Received: by 2002:ab0:63c7:: with SMTP id i7mr28144130uap.109.1577453475785; 
 Fri, 27 Dec 2019 05:31:15 -0800 (PST)
MIME-Version: 1.0
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
In-Reply-To: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 27 Dec 2019 08:31:04 -0500
Message-ID: <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
To: Jairo Quintanilla <jairo_6875@hotmail.com>
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
using -- nouveau or modesetting?

On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
<jairo_6875@hotmail.com> wrote:
>
> Hi mates,
>
> First to all thanks for your help.
>
> I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlinux, but I have some flickering issues when playing videos, only in the video windows.
>
> Sometimes I can see some flickering when scrolling.
>
> Please help. I don't know how to fix it.
>
>
> Atte. Jairo Quintanilla
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
