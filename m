Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53766524C6D
	for <lists+nouveau@lfdr.de>; Thu, 12 May 2022 14:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B896B10E364;
	Thu, 12 May 2022 12:09:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9F210E364
 for <nouveau@lists.freedesktop.org>; Thu, 12 May 2022 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652357337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHZJIqwM0CN6jUxey6wVbAiYgQhWMsmgj67/D8xAc7E=;
 b=BHKS21IAOSENssaAONSC8jiyu/kwWSzWh1z4imA4E1Lwr/ESkjIdCPsq0SOHAkTKH/VcTO
 Pqmt7+aD4Emz5Q4tGbSqs2oztOZJwww3LjxD2tIMb8gGksiGfWKPJi5su3mkl51C0zfRSl
 XX2xsPlEjEfVAlySsZFMjOrBCmUcHlY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-jznzqTfCO3SVbuPlj_RAlA-1; Thu, 12 May 2022 08:08:56 -0400
X-MC-Unique: jznzqTfCO3SVbuPlj_RAlA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so1991579wrh.8
 for <nouveau@lists.freedesktop.org>; Thu, 12 May 2022 05:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHZJIqwM0CN6jUxey6wVbAiYgQhWMsmgj67/D8xAc7E=;
 b=TnhAVfcRZe9rGki+36WOsW46zEVjVENI/yPOYEosfWutmdZX0YGeeBpyGHGiy5weQ0
 DodqhqiZq5xId8VQLBLtl/CmzgkKZTVdceNPYn9Wr7JdsBPM7dCKd4UZYaj2bqKr7BnV
 F5GxXeAUZzI/pfPsmtSD7bg1bqbQ+GckbCjvwOG7m5pN8DqRl8EjNWPhFix7XXYxxnkV
 vQTZP1/mSU8LpZPhFDk7bhGjbHr/LBclmIbpTsB2PijjH24Sem81ypVFd0CjY7bEg5Xd
 b0q1xRfazdKpV3zqA0vCs3IvWw4BVUxQMBV8Knydttq+9fhw+x+p+gUzCOY3Nlg9Ff7l
 o+kQ==
X-Gm-Message-State: AOAM530h6wy/RlaWlHd0L4pfAe/T0favqCFNXYLUgdi7Xvuyw0MvFjZI
 oqogCH8CQiSe5XqMvTcllht/tMv1xzAXCLpHODqCBzsLwBCow/6Y4zhoWmBiAGqprFV/u6R49+0
 D48uzylab++sCutp/UdCQ1Yu2QkcO78dPVJJw5UuyBw==
X-Received: by 2002:a7b:cb47:0:b0:393:dd9f:e64a with SMTP id
 v7-20020a7bcb47000000b00393dd9fe64amr9794076wmj.170.1652357335111; 
 Thu, 12 May 2022 05:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYaP7q7bkytSjPCMOZ8C7f67sA8ea2yFMuG4uP3j8nwtI21R3YkkFlSqcsx2bod0xUnUW/fM/uK5dZMvJqO6M=
X-Received: by 2002:a7b:cb47:0:b0:393:dd9f:e64a with SMTP id
 v7-20020a7bcb47000000b00393dd9fe64amr9794054wmj.170.1652357334929; Thu, 12
 May 2022 05:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <bdc569d7-ea37-809c-74ab-b34158ca645c@le-bars.net>
In-Reply-To: <bdc569d7-ea37-809c-74ab-b34158ca645c@le-bars.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 12 May 2022 14:08:43 +0200
Message-ID: <CACO55tuAvanHF87xaC8WRiyO5BnHPVn3bxAc+Pix4+yOGv++Rg@mail.gmail.com>
To: Yoann LE BARS <yoann@le-bars.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] nVidia has freed some modules,
 what to expect for Nouveau
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

On Thu, May 12, 2022 at 2:08 AM Yoann LE BARS <yoann@le-bars.net> wrote:
>
>
> Hello, everybody out there!
>
>         It turns out nVidia has recently released some source concerning GPU
> kernel module:
>
> https://github.com/NVIDIA/open-gpu-kernel-modules
>
>         At first sight, it seems to me some good news. I wonder: will it be
> useful for Nouveau? Will it lead to some change in Nouveau?
>

all the code can be used to figure out the more annoying bugs inside
the driver. And the firmware is redistributable, so we can make use of
it for performance and the likes.

>         Best regards.
>
> --
> Yoann LE BARS
> https://le-bars.net/yoann/
>

