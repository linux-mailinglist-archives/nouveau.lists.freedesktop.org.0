Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEB66AD52
	for <lists+nouveau@lfdr.de>; Sat, 14 Jan 2023 19:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCB010E235;
	Sat, 14 Jan 2023 18:56:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E23D10E23E
 for <nouveau@lists.freedesktop.org>; Sat, 14 Jan 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673722578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AXHP4vmdSOTVVgF00Ub+U89drkXSQBR/JVMraYuO3x0=;
 b=Y6um8HballHZZLHgn7byIrHvtdQCidax4XUdKEC5ubqOmG9KcDthS11/VbjxAkHvthaBN0
 tujVVQ/uEl1+KN1stCvTIiUteYItehrG2/zqAM1IZWrcpbbip4UujOJNrDPutGTNujMjo0
 iAMU5t1eVMDOH7wlE1hcB3ZZCJLlVRY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-295-77uXSJd7OreTFRRVuUnPxA-1; Sat, 14 Jan 2023 13:56:17 -0500
X-MC-Unique: 77uXSJd7OreTFRRVuUnPxA-1
Received: by mail-lj1-f198.google.com with SMTP id
 r10-20020a2eb60a000000b00281ccc0c718so6368141ljn.0
 for <nouveau@lists.freedesktop.org>; Sat, 14 Jan 2023 10:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AXHP4vmdSOTVVgF00Ub+U89drkXSQBR/JVMraYuO3x0=;
 b=fFMhu2+RVzXJtnrRU5NX+TCo8lVSUtx1Q47pk1lK/qHNjeSvBHmPLRMfI3NUNqqnCT
 EDJgZZwJdJxPKbUGJ5OJt2fKhQe3OnLXHlOlBqn2JMv35N9pXdCrnhaeqAdr/41q3ppG
 GpMp9F4hikLgbPFFBTdH+atExBfUEbZXPPl6s1rK9lkEZiS9YQjadxt/fxThuPp+Tbf+
 OzmAeJHRvS1zTi8s0g5bKLKwkx/Y561/EAvYuWZGSluw60lQJ2FpvCWNQDvPpK19arVG
 cwz0+DF5EOfJJ3sLrmrdp8j9g8mg+Fb0amrKJrQnjIyKV/ZgRrWkZNLL/1X4K/8E7YH9
 vbKQ==
X-Gm-Message-State: AFqh2kqU0YWzZVGDX+dc+ajAPqlvmFcnavH3iLqy+YUKjB/iQalU6BYR
 SZKOvo5Dr+rezFu5+K0XDrESn2neU/YTY+AKSzE/OWskBRJnxXTy3EWWWYxagMM2XjjYIuoKGbH
 XlP/LmYdAv255nBNtLOC1jruKdq08hnm9cdiXZfVNmA==
X-Received: by 2002:a05:651c:149:b0:287:4eeb:53dc with SMTP id
 c9-20020a05651c014900b002874eeb53dcmr884883ljd.27.1673722575795; 
 Sat, 14 Jan 2023 10:56:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt5Mu8PJf+/bXqZgwCzYqz6n0H/o6+lRjfPUJtA6rMdJkISya4bxJjhHdQkz4fgSum9S2xn4ipskm1xaWFTl4w=
X-Received: by 2002:a05:651c:149:b0:287:4eeb:53dc with SMTP id
 c9-20020a05651c014900b002874eeb53dcmr884876ljd.27.1673722575480; Sat, 14 Jan
 2023 10:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <c32ea02c-d706-ea2f-aa13-660b8db958ef@leemhuis.info>
 <481f19ba-da7e-6900-0bb2-64ba92d59ce6@leemhuis.info>
 <CACO55tv3E7y31MgyhW22GdDkE=XCYJF+boMivc5AEmyQ-svMhA@mail.gmail.com>
 <20230114160336.2jsh3ztij6cpzcee@wslaptop>
In-Reply-To: <20230114160336.2jsh3ztij6cpzcee@wslaptop>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 14 Jan 2023 19:56:03 +0100
Message-ID: <CACO55tvm0wBiA4Oi-QKmi-Q09Y4FXsjb4+0=T9f0DKUXSGEErg@mail.gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [REGRESSION] GM20B probe fails after commit
 2541626cfb79
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, Daniel Vetter <daniel@ffwll.ch>, airlied@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jan 14, 2023 at 5:07 PM Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>
> On Sat, Jan 14, 2023 at 04:27:38AM +0100, Karol Herbst wrote:
> > I tried to look into it, but my jetson nano, just constantly behaves
> > in very strange ways. I tried to compile and install a 6.1 kernel onto
> > it, but any kernel just refuses to boot and I have no idea what's up
> > with that device. The kernel starts to boot and it just stops in the
> > middle. From what I can tell is that most of the tegra devices never
> > worked reliably in the first place and there are a couple of random
> > and strange bugs around. I've attached my dmesg, so if anybody has any
> > clues why the kernel just stops doing anything, it would really help
> > me.
>
> Hello,
>
> Thank you for looking into this! I have seen this type of hang in
> mainline on this SoC, and it was due to a reset not being deasserted.
> Would you mind getting a log with initcall_debug enabled to pinpoint
> where the hang occurs? I would be happy to help if I can.
>

the last thing printed is:

[   20.517642] calling  clk_disable_unused+0x0/0xe0 @ 1

> > But maybe it would be for the best to just pull tegra support out of
> > nouveau, because in the current situation we really can't spare much
> > time dealing with them and we are already busy enough just dealing
> > with the desktop GPUs. And the firmware we got from Nvidia is so
> > ancient and different from the desktop GPU ones, that without actually
> > having all those boards available and properly tested, we can't be
> > sure to not break them.
> >
> > And afaik there are almost no _actual_ users, just distribution folks
> > wanting to claim "support" for those devices, but then ending up using
> > Nvidia's out of tree Tegra driver in deployments anyway.
>
> > If there are actual users using them for their daily life, I'd like to
> > know, because I'm aware of none.
>
> For what it's worth, I consider myself a user of nouveau. Granted, I'm
> using it as a hobby project, but in its current state it is not far from
> a usable desktop experience on the Pixel C.
>

okay. I mean, I'm happy to keep fixing regressions and figuring out
what's wrong with booting the devices and such if regular users come
around and file bugs. And until today I wasn't really aware of anybody
:)

It's just not worth my time, if there are no users using them at all.
Or rather.. if there would only be commercial users (like.. companies
deploying those for money), then they could get involved and help us
out, because I wouldn't be willing to spend my time on this, if that
would be the case.

> Diogo
>

