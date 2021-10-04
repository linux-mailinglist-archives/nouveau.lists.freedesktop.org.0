Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B642118F
	for <lists+nouveau@lfdr.de>; Mon,  4 Oct 2021 16:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB556E9D2;
	Mon,  4 Oct 2021 14:35:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F85F6E9D2
 for <nouveau@lists.freedesktop.org>; Mon,  4 Oct 2021 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633358132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUY7CafWbrSmAxfBWbVavN+A3FgAQRgD0YrIWBkosT8=;
 b=aIz+M9ZcC7KU/uF+lxNDGy3nxEC7yR8ch9CpSwsOK1bhe4gleSZGl6Wr4oF6b8VSQmEJqc
 tx3317rxRVaU9Q0SkxuT0yixKao4051qrDotYJ9+4Rv07/MlfXMooTiR4zO8gvGuOHHRkN
 ow7EbX3ubyG99uWcvTALAVz/hvGyw3E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-ym0uFip5Oi-Bj5dqpOcPWA-1; Mon, 04 Oct 2021 10:35:31 -0400
X-MC-Unique: ym0uFip5Oi-Bj5dqpOcPWA-1
Received: by mail-wm1-f72.google.com with SMTP id
 u3-20020a7bcb03000000b0030d5228cbbdso4270799wmj.3
 for <nouveau@lists.freedesktop.org>; Mon, 04 Oct 2021 07:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SUY7CafWbrSmAxfBWbVavN+A3FgAQRgD0YrIWBkosT8=;
 b=d3001YBAkmQpH9nMgd9NiWGyXjkT3Q8RYhjII9Tybp4LvGtmrx/GdQ3NqsTWCF92a+
 xFDsoH9vsvDA1+eD9pGCLmiGeLsVMv9x9uxSKtwUlMgCIBiz6eTrW/8c/dfqwSEslRrf
 cUaKWIHwUwlinyjpPNpqYt7tfDze7xJumz30Kf5NnPFPLScueUYdFQnUn5UTSyfw56Wx
 /eBs9+C1UxaNe13sv6+d8uUyrUY5fyEBEIFKtzQllYUYRTYQHnlahpCCsPPT+H8nGs06
 /B4YbBsqlrgzL6H/fcTLAudgZFpa3d/V04S8fYvHV29Te0E/t8F+Ew6w0ExjbfurLE6/
 M38A==
X-Gm-Message-State: AOAM533DS1Z9BKxzR2qpyzCn5rqmKu9goX2Az0vflVCSCxoUkAyLKv7X
 r/srZc17xg88XGlMrR/QlixxrT7YmhqWb9VwIevQ1HPq2buX5nYdukVbWN7HFd+PyRggVeTt0E7
 AogowuzIxj8NuFxaOZB4aZT62tXRPExdvpVEcwsQmQg==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr19229714wmk.141.1633358129490; 
 Mon, 04 Oct 2021 07:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsKATGhbyk1Mual4sS0bkE09O0QUHMs4QsIBTR4Ty7M5IYqpnrzrnvCiGnqPl0kFHa/H91kgxl4MLvqlFGVcw=
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr19229695wmk.141.1633358129307; 
 Mon, 04 Oct 2021 07:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <CANj0vJkjpj_wQPVKo65ZKTgvTjXOfpC3hBdW60Z27c0mY8ejtA@mail.gmail.com>
 <CACO55tvnT4mT1cVyMTOig5M1kVj07i8ZH28EN11fYYuB+L+abg@mail.gmail.com>
In-Reply-To: <CACO55tvnT4mT1cVyMTOig5M1kVj07i8ZH28EN11fYYuB+L+abg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Oct 2021 16:35:18 +0200
Message-ID: <CACO55tvz+ELx3Dm--=fWZo1p2vvAoo1VsOLv51r+0O4VittD0w@mail.gmail.com>
To: Oswaldo Graterol <oswaldo.graterol@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, glenn.kennard@gmail.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Nvidia GeForce 8200M - Image flicker
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 4, 2021 at 4:31 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> We actually fixed a few of those issues on those old GPUs. But I don't
> think they are part of any mesa release yet:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/1387d1d41103b3120d40f93=
f66a7cfe00304bfd7
>

actually.. seems like this patch got backported to 21.2.0 and 21.1.7,
so if your mesa version is older it's worth trying a newer one to see
if the problems improved at least a little.

> and we have a pending MR:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12154
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12241
>
> Glenn, is there some update on those MRs? In case you are short on
> time, maybe somebody else should take a look?
>
> On Sat, Oct 2, 2021 at 4:24 AM Oswaldo Graterol
> <oswaldo.graterol@gmail.com> wrote:
> >
> >
> > Hi,
> >
> > I installed lubuntu 20.04 amd64 in my old laptop (Compaq CQ60-210 US), =
but the screen flicker when i open some program like firefox, i tried nvidi=
a drivers to GeForce 8200M GPU, but no work to this hardware, i want to use=
 nouveau drivers but need to fix the flicker problems. Can you help me with=
 this?
> >
> > Thank you for any help you can provide.
> >
> > --
> > Oswaldo Graterol

