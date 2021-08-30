Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33313FBAAA
	for <lists+nouveau@lfdr.de>; Mon, 30 Aug 2021 19:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2518C89DDD;
	Mon, 30 Aug 2021 17:09:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B716089DDD
 for <nouveau@lists.freedesktop.org>; Mon, 30 Aug 2021 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630343367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/p1OSWm2CX6t/EcjGNpZmpBR9OMpxp/jIg4r2klJBs=;
 b=OmNE37gPnl3l+x6buPivFEmeltpOgrZ/8IaS3CumcRnInN72HOamwcUc0i2LDeFncrMTWM
 2PiFzCYr2MAXz77Dj/8lCv0bIfNevZL7j78w5i7d1ZwzNBtNqsCIt4CMCKGWLrvki5vYFD
 i9ttlRN/gnKW9tPL6hTaAefBRuWdihc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-2r6KZxr2PYWmJ8Sxc8IZzA-1; Mon, 30 Aug 2021 13:09:26 -0400
X-MC-Unique: 2r6KZxr2PYWmJ8Sxc8IZzA-1
Received: by mail-qk1-f200.google.com with SMTP id
 k9-20020a05620a138900b003d59b580010so340099qki.18
 for <nouveau@lists.freedesktop.org>; Mon, 30 Aug 2021 10:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=C/p1OSWm2CX6t/EcjGNpZmpBR9OMpxp/jIg4r2klJBs=;
 b=FguIwPJxYLWaRl0P9AC2KsgrlD6/5GGMFsGKI2TuhIKXwKZxkqfHtRRK+DV+qWhDbI
 MXY+ZGnCajH21ttjJfrfH5c3t9Lvw2TfrJzOkNu8SNIQN6O6mvSrwzZROpqPr6QLZp0b
 rL6veojFg/a3cjZjrsUaBo/UeYOgvEdAs6dv80eXdYHtOQfgmje9TlStRXp6Fi2ztr94
 03DGGFu1+UwF0gu3lc2ZDnmbx4qcECOC/QuHl+V02Z8AiU2m/nTq3esuDFxJEG3igWsZ
 UQgwMRoW5qQWL9Vny0QjiXhgUdGlVTOmes7KNhbDUd77tzYXmWbAuphZln0vzqLW4rb2
 m2RA==
X-Gm-Message-State: AOAM5337V5ZkK8LQ9m0VguEBI0GGZc/Sb+tBTlmqvkmBzJe7Vjzai8Ys
 yuUct4iRH+c+p+423LBcWt5FkIjGCR3kR+9Ht7tFNg9DYB0jCK/6omf0TFjaP4RMoNeRsJCNZWM
 aYjIvtsFsh38iZ8HXXCp1dzhz2A==
X-Received: by 2002:a37:8f04:: with SMTP id r4mr23370421qkd.351.1630343366109; 
 Mon, 30 Aug 2021 10:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhvH3r1WkYkyhjkLLonaz0tUVij62Is1SewKkxp8wDoeh+XEGYZJb1rr+7K3QO3YKZJeC6uQ==
X-Received: by 2002:a37:8f04:: with SMTP id r4mr23370410qkd.351.1630343365881; 
 Mon, 30 Aug 2021 10:09:25 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id m68sm12047562qkb.105.2021.08.30.10.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 10:09:25 -0700 (PDT)
Message-ID: <0777c34ddbd22ae247d293cf013cb763947b0b50.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Skeggs
 <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Mon, 30 Aug 2021 13:09:24 -0400
In-Reply-To: <c0e64fb9332b03c920de05be4c4c27f916ff6534.camel@redhat.com>
References: <20210824005356.630888-1-sashal@kernel.org>
 <20210824005356.630888-20-sashal@kernel.org>
 <6607dde4207eb7ad1666b131c86f60a57a2a193c.camel@redhat.com>
 <YSzMR4FnrnT5gjbe@sashalap>
 <c0e64fb9332b03c920de05be4c4c27f916ff6534.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH AUTOSEL 5.13 20/26] drm/nouveau: recognise
 GA107
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

oops-except for "drm/nouveau: block a bunch of classes from userspace" of
course. the rest are fine though

On Mon, 2021-08-30 at 13:08 -0400, Lyude Paul wrote:
> ahhh-ok, that makes these patchs make a bit more sense then. If Ben doesn't
> have any objections I'd say these are fine to backport then
> 
> On Mon, 2021-08-30 at 08:17 -0400, Sasha Levin wrote:
> > On Tue, Aug 24, 2021 at 01:08:28PM -0400, Lyude Paul wrote:
> > > This is more hardware enablement, I'm not sure this should be going into
> > > stable either. Ben?
> > 
> > We take this sort of hardware enablement patches (where the platform
> > code is already there, and we just add quirks/ids/etc.
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

