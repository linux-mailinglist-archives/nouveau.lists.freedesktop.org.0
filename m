Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3041F959
	for <lists+nouveau@lfdr.de>; Sat,  2 Oct 2021 04:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4933D6F468;
	Sat,  2 Oct 2021 02:24:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F086EAB1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Sep 2021 15:09:42 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id b10so1823514uaw.1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Sep 2021 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.unc.edu; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=D/O+NPyNGwLtciZ8Yu1dLsqPDXbE7nFv8DHaikTZgJY=;
 b=A+MX/AGMwpVT0PZVXCkLzp2fBGW2dm+i5JMGn8zDYxH1sYdHORkRHRkow9PWoVyvJ5
 lol6HnhWFR+Lb8vb26unkRKXrSVLZz9CEwR6MN8VyRyEWHyeyeI2sQj0ZdSV5Q7oTgUB
 0JRBASHor3kY8MlmuPoIAJSxgv091xD8xPnB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D/O+NPyNGwLtciZ8Yu1dLsqPDXbE7nFv8DHaikTZgJY=;
 b=glIaLDQGsCOXtGJZ3+thUl1RthQcsg4Lcd1hwFg51785z5jEC0ni8e+5rmFJrHBb8n
 kX9UmVJOo+kJddpsKuX4L5a6PyfkGo9PHfKFJHYEx5iIpWCkZjIbqf+VCKtabx+iVkbV
 o5fRnb1RFA1UC5JIEf0c2eYfIrWT+QCik48rnu2pKmiLsQCkJ36dxjlO5r+7QIloZIf1
 mFHCiHIFlUuxgZzcDARafRDa40Kzhub9NKFEVdEfGda91TIaRHrILVzE0ycqBtN5kTLy
 pGwbcyUyuVlxYP3uInoFUL/3QAumh3quj8ZruZqfs4wlU6Uycg0691niqXGeU7rqV4EI
 itCg==
X-Gm-Message-State: AOAM533O6HG9yTiwxjs3bfnL5Ytxi1GPfrhCaYFCeQLSH4s0Qv4BTcK3
 9SbZlwsBQBF8GJ9HlRXzcV+mfnzlnTC6SdJDDKwSjk7TPVAUGiEu
X-Google-Smtp-Source: ABdhPJwRtx5OZRsRDYtzYUuu12hBGNuR7FQX0Nn3GB9wD1rSV7eCBiYZuSk8XX9weBKHrb3XjrHfmMAI65aJjbTJp4Q=
X-Received: by 2002:ab0:5bdc:: with SMTP id z28mr603509uae.35.1632928181301;
 Wed, 29 Sep 2021 08:09:41 -0700 (PDT)
MIME-Version: 1.0
From: Joshua Bakita <jbakita@cs.unc.edu>
Date: Wed, 29 Sep 2021 11:09:31 -0400
Message-ID: <CAAy0SxA4zz1Sn1qH_QOgug2zg+zoSvepRr-dsnab-Zv7YFK6_Q@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 02 Oct 2021 02:24:00 +0000
Subject: [Nouveau] Understanding BAR1 Offset to imem/VRAM PA Mapping
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

Hello,

I'm trying to understand how VRAM PAs are mapped to BAR1 offsets on
Fermi+, but I'm having difficulty digging through the abstractions in
nouveau. I spent the better part of yesterday digging through the
nv50_instobj_*() functions, but I lost track of which page tables are
being modified and where they're coming from somewhere around level 7
of indirection/aliasing from the nvkm_kmap() call (aka
nv50_instobj_acquire()) to the actual nvkm_vmm_iter() logic which I
think does the mapping.

If page tables are used to map BAR1 offsets to VRAM PAs on Fermi+, I'd
like to understand their relation to the normal GPU VA to PA page
tables, and how we tell the hardware which page tables to use for the
BAR1 mappings.

Best regards,

Joshua Bakita
PhD Student
UNC Chapel Hill | Real-Time Systems Group
