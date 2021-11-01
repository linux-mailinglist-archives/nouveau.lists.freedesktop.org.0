Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E784422E7
	for <lists+nouveau@lfdr.de>; Mon,  1 Nov 2021 22:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807536E1ED;
	Mon,  1 Nov 2021 21:48:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27686E1ED
 for <nouveau@lists.freedesktop.org>; Mon,  1 Nov 2021 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635803335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DLpDOAGbW+MJRL2f/hYEjotaY2tvvZbWw0vIDSR4zSg=;
 b=iEpx9vyZ45lMql8/eNHyGz2Oso5w/EVzPM683E6HfWtNF4CHQ1w9CIfFf4P+3g2ICD8DZr
 P9qiT7EBSp3+rU48TypFN+36eVbpRpmhzCNRntOGXNs28c+QYkJl8wIGwQqpUeI7qjoB9B
 scVcSRzF8bbu+5zWLXdO/GPeULqDBbQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-38ny6uMjMjGD1KDyKQeYkw-1; Mon, 01 Nov 2021 17:48:53 -0400
X-MC-Unique: 38ny6uMjMjGD1KDyKQeYkw-1
Received: by mail-lj1-f199.google.com with SMTP id
 v13-20020a2e2f0d000000b0021126b5cca2so6661769ljv.19
 for <nouveau@lists.freedesktop.org>; Mon, 01 Nov 2021 14:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLpDOAGbW+MJRL2f/hYEjotaY2tvvZbWw0vIDSR4zSg=;
 b=W5X+sIWnJjloqXTbwHD7uxDWKBbrIRulYgUHF2JCRQ4vo2bwwxfAnIHbFDKs2G1GbD
 yvGR87hgBHmCwdQf+OEl0KBmOvrwQeqjNlrvYC0QNVKhJDZrscUsgYTWpTNRwdD21sxy
 KnaLAMJhJpTAsFeyZ4UZcycyYMJE1WxhwSsyo815VTCkuyMk7gRxXsVZlkd2qTIsIAav
 ZDc2SoykmqlEg+htZnmlWJsSBUoW7a2ftLVsmQTEfYdt8RG9bQRyGynRGRdU3hbztZ9L
 V94MhFShujULsNUO9IcknAxfvNwZKxRunJI+4r9qibiMvKC6WfUBJM3nbMf70CmV+s3q
 wFZA==
X-Gm-Message-State: AOAM530VIhJJdReTBZP5xk+WoWFb941uZWLhNMsfvYIvfvQZU+fXgP43
 RNlerw/L7lDU8wlTZj+Fiq0vckt68CNPdHI43L9qRLvk2ZnkjL3nhNfNV+y8sZwFxsiXTuNHyFe
 90tY4ngjITaWV18JNlK6WmsWQye4E2G21qM98FXRdZw==
X-Received: by 2002:a05:6512:3a82:: with SMTP id
 q2mr3807384lfu.17.1635803331967; 
 Mon, 01 Nov 2021 14:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ7PvI6rm5v1k1gTuTGn9Gx/yJODZbXWzt/ypsRS9f842y8wYsD8gWLellk7GIe0DDmf45Z09wT77a6qm0ci8=
X-Received: by 2002:a05:6512:3a82:: with SMTP id
 q2mr3807364lfu.17.1635803331661; 
 Mon, 01 Nov 2021 14:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8U+g_=X07mpM4_EJ_vteqTNdYqH+Ev7ihgea25qJW-3FZ_uw@mail.gmail.com>
 <CACO55tuZwYJKKBfHd5cgEv3_ry+B5fMO=4KCUGhvwyX8=Kq_hQ@mail.gmail.com>
 <CACO55tv3DfrYObTfP7OqzOH6mESXx_KD5HRDtDaikUr0gH3hGg@mail.gmail.com>
 <CAD8U+g8n8DDEKxGg0mNjGwsZ8+0PFyM6PSzzD7ThKvqNowciQw@mail.gmail.com>
In-Reply-To: <CAD8U+g8n8DDEKxGg0mNjGwsZ8+0PFyM6PSzzD7ThKvqNowciQw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 1 Nov 2021 22:48:40 +0100
Message-ID: <CACO55tsNWi=Uv8Wmb54MTVA_jYxhqA6fHqUjhy1S2knF6mq3GQ@mail.gmail.com>
To: riveravaldez <riveravaldezmail@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Various kernel error messages on updated Arch box
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Nov 1, 2021 at 10:37 PM riveravaldez <riveravaldezmail@gmail.com> wrote:
>
> On Monday, November 1, 2021, Karol Herbst <kherbst@redhat.com> wrote:
> > Actually.. seems like somebody already filed a bug like this:
> > https://gitlab.freedesktop.org/drm/nouveau/-/issues/91
>
> Should I add my dmesg there?
>

yeah, I think it's still helpful, maybe it looks a bit different for
you, but once I get a hold on a GPU with this issue I can start
looking into it. Or somebody else does. The reporter of the issue
seems to have already done a git bisect, but I am not quite sure how
the fix needs to look like atm...

> > Seems to be more widespread so I will check out if I hit this as well.
>
> Great. Thanks a lot again. Let me know if I can help.

