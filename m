Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FE23E0398
	for <lists+nouveau@lfdr.de>; Wed,  4 Aug 2021 16:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20446EA98;
	Wed,  4 Aug 2021 14:43:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2526EA53
 for <nouveau@lists.freedesktop.org>; Wed,  4 Aug 2021 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628088213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFYUSa3dRghMYe581f3uqD6OPPYe5RTO9O4Oxh6XB5I=;
 b=SdL1aHBKgTm6gcbnxkeRkIOKlJmEetcQudRSgQrLcXM4j2155L0/lL/giPTBmJanc65B2w
 1ctFBRCWehsOXTapBIPCxqrDa73ZD8w2IG7IIlfECAGC3zkLs1fTU1Tgw9/74/T9hPe4Ut
 DpvoHqEzcTbuy8tp0GhnWjIkn6s+Yuo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-MKpJdNtTODKRQADn6NCq3g-1; Wed, 04 Aug 2021 10:43:31 -0400
X-MC-Unique: MKpJdNtTODKRQADn6NCq3g-1
Received: by mail-wm1-f71.google.com with SMTP id
 o67-20020a1ca5460000b0290223be6fd23dso368548wme.1
 for <nouveau@lists.freedesktop.org>; Wed, 04 Aug 2021 07:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFYUSa3dRghMYe581f3uqD6OPPYe5RTO9O4Oxh6XB5I=;
 b=OJVXghHIDE/FNNYJX7iuFQEyUE/pCV5vdofd7VwSh86mVro856tidVvJtlPK1BX1m/
 S9Ch+ug2YpMxj+D0IepCbFH22AnjfaNVHJijvCVSIftBJE/QBcWsECGp3JGMsMRjL7wa
 swYM5QnJhFVOxzNbgNAKH2lCIrl97X0ffOCCnzH3b5SjlfnEkNFWZmZXaqrvpOqdjV/L
 fuN9KqulATwvkozvBA0x8fdvp8uDZDLDE51vlM7drg+7CMyW34hcLCfmW7xfIEm4Mxil
 Vdl4ZMk0VCJRyqsWwcAtVq8hcHRsIQFa2Ua0IuVxf+w+pXTQvcEyXdfGMNdYKJbWE5zT
 /P3g==
X-Gm-Message-State: AOAM5308VKgJmEmhiO3A+eGDoe0K0TDtiariqRS4z6D5UqzuvtiQDNpe
 gYM+qxDpWhsjIh2svhmYi3LjAViJtuop1zky2anMYmJUnIZqPXH45XmS48QwcLChu7t/1h5ENrD
 qF6zbJfVk3fG1ywHQVBX7qw/CpSe2onTIGUYDqkae2w==
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr10229065wmm.171.1628088210718; 
 Wed, 04 Aug 2021 07:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwKeR2z5x/HL0NvZb68pP377KTS2HGMKbAH8tOqgYY8tWUV+n8t4legpd8joDAklG+ZHncu46UdSv0kNWBp5Q=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr10229050wmm.171.1628088210589; 
 Wed, 04 Aug 2021 07:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
 <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
In-Reply-To: <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Aug 2021 16:43:19 +0200
Message-ID: <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more
 devices
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

On Wed, Aug 4, 2021 at 4:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > playing around a little bit with this, I think the original "select
> > BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> > drivers selecting and others depending on it. We could of course convert
> > everything over to depend, and break those cycling dependency issues with
> > this.
> >
> > Anyway this change on top of my initial patch is enough to make Kconfig
> > happy and has the advantage of not having to mess with the deps of nouveau
> > too much.
>
> Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
> option itself 'default FB || DRM' though, to ensure that defconfigs
> keep working.
>

okay cool. Will send out a proper updated patch series soonish.

>       Arnd
>

