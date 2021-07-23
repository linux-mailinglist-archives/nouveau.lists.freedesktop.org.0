Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB653D4065
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 20:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5E56FC71;
	Fri, 23 Jul 2021 18:48:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F86F6FC71
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627066112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TT3QlzruQFM0O9S/g7+HR5WRHatrYiPktX1CpTRxfHI=;
 b=MkVLqrLloHwsyDjO5cgdF1YaktoR+OAhFpjgZkybTxViOLYA5T7YIb1hfGhEXkjdsZMnjP
 +CvixTtIaOauh7TjI94jZWDGlUbsleNNxKzKWX66jWhTeJDm8IB6LPu8T7J/sfb9HcmHvS
 WS7dZExoNgySvOZIEHrrvOawAER4Elo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-2ZcUtt4kMii3y79FpDjs6Q-1; Fri, 23 Jul 2021 14:48:31 -0400
X-MC-Unique: 2ZcUtt4kMii3y79FpDjs6Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 d14-20020adfe2ce0000b029013a357d7bdcso1268990wrj.18
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 11:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TT3QlzruQFM0O9S/g7+HR5WRHatrYiPktX1CpTRxfHI=;
 b=po6B6aKILZBgJDpZ6vvGZPO3UgnYGRzLOIK6VMmhL+KuLy26oERroQWuebmD3pu3Rd
 0WUMjWGncbXi+f3Q384TNClPy1K3Hl8kDwxTjlQngFhujQM6FvRVE50OEeRWonlayZzC
 +f8acWORqBoKvfQiaH/LqkgpG19ZVqGp2hVBCCWei7SURam+2nLUISiMboIivmj/n0uS
 KffkEoTieUwCLJCOYiJfyGu7ncH6DMciuPVgI7srCGau0MBqk3/ydxT9uYS7VGU928Pc
 nwtZg9dcMt55IgeguZMZEi2EsYO2DrYCDoFftIYIa3EGwoM1qCFLk6jFw3/mX1WDKGeP
 ytOw==
X-Gm-Message-State: AOAM533tmJshcatxNYFD6EcS1yzWbuil9JrlA6k/ngpME+T++rJB6UBw
 7/LeKmJ55u2t8zryhCjJIs8ivhf7+/31vG6eD82Q3HD9QMl39JQeb9W2r7lqB6czfAaP4usWtaS
 iIyw6jszzuxCIn+YCpZROqs7s8Q17qLGjLqjuZE0J1Q==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr6982925wrn.113.1627066110109; 
 Fri, 23 Jul 2021 11:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZMoQyCFyEOCbinYmqYmEk4f3Ojj0mdfzboAjHeKt/OCfsnzDXsFZfcZoauHAS7H3EsRN3J0C10LA5+A8j6co=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr6982917wrn.113.1627066109896; 
 Fri, 23 Jul 2021 11:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
 <a618e29a-e4b7-bda4-a3e0-7dfd67d64e92@infradead.org>
 <CACO55tvQoCnjQWRJhrJ+8TzY5MuDDSUSnwd5AU8G1qsQYCSCBg@mail.gmail.com>
 <7ddd0c7c-9bdc-9ea3-c635-f1d141d1e870@infradead.org>
 <CACO55ttjQO5kUeEA7opvGLAwT+a1t0vAguncKDhB4bdy96K7LA@mail.gmail.com>
 <CAK8P3a0YiAgTLptmPbK6vczkMi7F=tzE-Ae8GPFnBtbvQnoF0Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0YiAgTLptmPbK6vczkMi7F=tzE-Ae8GPFnBtbvQnoF0Q@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 23 Jul 2021 20:48:19 +0200
Message-ID: <CACO55ts5C6xodqstoeCvhpRpMOB=nTTPDnBfN_QT2GJe2F4wNw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 8:40 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Jul 23, 2021 at 6:34 PM Karol Herbst <kherbst@redhat.com> wrote:
> > On Fri, Jul 23, 2021 at 6:31 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > On 7/23/21 8:15 AM, Karol Herbst wrote:
> > > > On Fri, Jul 23, 2021 at 5:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > >
> > > > what's actually the use case of compiling with
> > > > CONFIG_DRM_NOUVEAU_BACKLIGHT=n anyway?
> > >
> > > Dunno. In this case it was just a randconfig. Still, it needs to be
> > > handled in some way - such as the other suggestion in this thread.
> > >
> >
> > sure, I was just curious if there was a specific use case or just
> > something random as you mentioned.
>
> I think this is purely done because of tradition. A long time ago, we had
> tiny framebuffer drivers and most PCs did not have backlights, so it
> made sense to leave this optional.
>
> This was probably just always carried over.
>
>          Arnd
>

okay. I think I will write a patch for nouveau then and send it out soonish

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
