Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C641F573
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 21:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59656F3A8;
	Fri,  1 Oct 2021 19:06:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AF66F3D6
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 19:06:04 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id x2so11644390ilm.2
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 12:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+B5pNiz5A7nxyg/+RyImTGREUs8jhp6dOa8lFB4K9Y=;
 b=N6mmwELRTd7K3P7JieOxm627HmlsDpn6KI9jJcIChnk7pdiNyT/jCBKNFHKNYRSmd1
 OQ4EkR2ZSuffJe0vpTC5Htma5DjIG/ugOio95gvABY7KakFnV5ILXrXMDcwQycfjO8G5
 B22YtJVD5QdS2wvIqAVvxatIYRilSA3VcCQZfBF5mF2dn7Ric6gNAkGCiRX3v5rbXGtd
 rLkErFDFseL6AGSVMF9Nj8kdfFYvqNyTHdB48Z375O1fYabHbUX85ryy0wLFcOuJIR0c
 8whyAnOlHcPXR/KHKiv7v6AIQzaE39UrDdN/G/sCqwsGxzexFKBgVkQJ7t1+zg9dL/1N
 2wAQ==
X-Gm-Message-State: AOAM530BpbFxB1u6bnoXZiP9G+MNQE+Zt/IpccXouWCB0ay1Wn20QGqP
 xxEQMSN/1bgCMznPInta3fUUwdfxUW/DSmUYlNo=
X-Google-Smtp-Source: ABdhPJxvXdDG/7csyG4jbCqFvXHkttAt7Oak4IUcuAYBi+PsPAg1yOZ2LEyHe4GEn9Ztxixk/xiJq7JFapg7PkeJTao=
X-Received: by 2002:a05:6e02:1a63:: with SMTP id
 w3mr10443360ilv.235.1633115164105; 
 Fri, 01 Oct 2021 12:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
In-Reply-To: <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 Oct 2021 15:05:53 -0400
Message-ID: <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
To: Jerry Geis <jerry.geis@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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

On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> lsmod | grep nouveau
>
> What dont I have ?

nouveau :)

Other than that, you got everything...

Check dmesg for errors.

Cheers,

  -ilia
