Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF13FBAA5
	for <lists+nouveau@lfdr.de>; Mon, 30 Aug 2021 19:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBC989D30;
	Mon, 30 Aug 2021 17:08:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD0E89CB8
 for <nouveau@lists.freedesktop.org>; Mon, 30 Aug 2021 17:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630343330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJ2p1fjjD8ERbYVIX3Rp+Pa17H7hfIARQi230Atxhhs=;
 b=MR2kCycf8GQK9MlJgIFdPD1/6Mf/kjaXYdzpK3kiKEn4OuOdO++XGM6FZnBsqSIEmUQ9F2
 gu2KxB0OP1/FfMnCnY5f0m+BcrVjPy0gSfOPuq8dGeE9HxHbbD3CrXgRve1NAoLGPMoZQb
 vhMpEejMGaK7EQvuuHuQUesIVjG9cKY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-FRgKSptgM0iZ7VYuKBIOCg-1; Mon, 30 Aug 2021 13:08:49 -0400
X-MC-Unique: FRgKSptgM0iZ7VYuKBIOCg-1
Received: by mail-qt1-f199.google.com with SMTP id
 r5-20020ac85e85000000b0029bd6ee5179so1393110qtx.18
 for <nouveau@lists.freedesktop.org>; Mon, 30 Aug 2021 10:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RJ2p1fjjD8ERbYVIX3Rp+Pa17H7hfIARQi230Atxhhs=;
 b=HpnBDmjmq2B6wPr/VmwwGHy7OdZT1EDxYfczqDsE2llPNmJO5+3xQAbRIq5DZaCRyP
 H/61n+3oAbiRiJOlZbkJjfOfuM5i3/xx8cS4vd4e3jeghOM12AefEzLgWHsnqD1/3yZi
 7XVEtKa75IXXzyYWoFVzVMGYFrpCj6NH33+qnFkuzCbNWhAQBlb3Akfv/JsKBeFsUssa
 wN996DOrTc+7hlBWVp5k3ZulK9lK5mDmNW8X7qOlI9leHDs9BtN6J9CQc0uJYzZ6BPQI
 uAy87bs2X13aJDnX8HK+4KIRZ3mCDI0/WgcXb3h5+b5OHq4oC4WTGwsmQTDZLlBVhjqI
 Dapg==
X-Gm-Message-State: AOAM530Xz4/KNsK51/2/guWUNc3VR+Q63tzJCvRDFE+snS16+s1ttlRn
 VsQcwzY/s3WeV4AozZXnIOT6zHXYjdLR/fLJ1M5yj8meXeIdttNP3AX8/jMdVMEmhyQCmvCXtts
 IICAT0C+gMFNHBxQqF2L0AFzfBg==
X-Received: by 2002:a05:620a:81d:: with SMTP id
 s29mr23761970qks.301.1630343329151; 
 Mon, 30 Aug 2021 10:08:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/+cPlJFfzxjZYDasfknZytxGolZm+T7/j6hx198c4EYh9UytMtKYed3Gms4R3lAi7g+R6nQ==
X-Received: by 2002:a05:620a:81d:: with SMTP id
 s29mr23761951qks.301.1630343328961; 
 Mon, 30 Aug 2021 10:08:48 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g7sm8835996qtj.28.2021.08.30.10.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 10:08:48 -0700 (PDT)
Message-ID: <c0e64fb9332b03c920de05be4c4c27f916ff6534.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Skeggs
 <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Mon, 30 Aug 2021 13:08:47 -0400
In-Reply-To: <YSzMR4FnrnT5gjbe@sashalap>
References: <20210824005356.630888-1-sashal@kernel.org>
 <20210824005356.630888-20-sashal@kernel.org>
 <6607dde4207eb7ad1666b131c86f60a57a2a193c.camel@redhat.com>
 <YSzMR4FnrnT5gjbe@sashalap>
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

ahhh-ok, that makes these patchs make a bit more sense then. If Ben doesn't
have any objections I'd say these are fine to backport then

On Mon, 2021-08-30 at 08:17 -0400, Sasha Levin wrote:
> On Tue, Aug 24, 2021 at 01:08:28PM -0400, Lyude Paul wrote:
> > This is more hardware enablement, I'm not sure this should be going into
> > stable either. Ben?
> 
> We take this sort of hardware enablement patches (where the platform
> code is already there, and we just add quirks/ids/etc.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

