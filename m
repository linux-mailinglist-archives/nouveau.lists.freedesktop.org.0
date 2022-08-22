Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F825A0289
	for <lists+nouveau@lfdr.de>; Wed, 24 Aug 2022 22:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2ABC5DCC;
	Wed, 24 Aug 2022 20:13:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0926B963E3
 for <nouveau@lists.freedesktop.org>; Mon, 22 Aug 2022 21:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661203116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJeumykxcZZw8oNVKcWzNJSONhGOMMsSh4arv2eUX+M=;
 b=Xe+DG2XqzEf8+twBYaXGqRRBHA0jfqGHUJzMJ1CUFlydSq10H5sKBl17rZmOdzYNEfDPwc
 DgwwDTWrQYfLDuhu1aIS9RRtOkS7yEu5qxIWMZ1ybU6XNZv+/glSt4c1Ywur9dMgs8+/4R
 1MbzhaNSqAJsqp/W99r2d7IznJfZLc0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-A1dekG11NT6Ya8QQ9eDbKw-1; Mon, 22 Aug 2022 17:18:35 -0400
X-MC-Unique: A1dekG11NT6Ya8QQ9eDbKw-1
Received: by mail-qv1-f70.google.com with SMTP id
 db3-20020a056214170300b00496c0aabfc9so5368965qvb.16
 for <nouveau@lists.freedesktop.org>; Mon, 22 Aug 2022 14:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=DJeumykxcZZw8oNVKcWzNJSONhGOMMsSh4arv2eUX+M=;
 b=TyiBhzNfZNPw55AgAoyf1yDYsV7WBICwjsdnY/w/KN7C/lkHXWGe/9Lw8PTqgLJyBi
 5Cw1KXsCvgSCA8XEg2m6phqEwBRPfQ0yBHaWFSatOAt0Ubkga65mQnv2oP6HqcTuSQqk
 DI5IIxQprLNB6WcyAppJ/qW4zE64SkHCPiV9sjdE5vV9WsgC4DwQuLJErx68s0c8DrSR
 ZxEUAw/ykuI+AbMEV80LD1OEIWfQNd0hB/1AtlD/Gl2q73hZ1ExBlF9FXulp1koU6q4m
 EyHB9QW7COCvXSqAcCYQGTJ0J7ww9XCzxq5Sm8eFO/aQ61B8/QbaVELWdiIVyqYAwv1U
 ACfw==
X-Gm-Message-State: ACgBeo2gUcYRKC6mJxtco45VxWZNQGtGVQTcVLf8af5AafFHGP5H52FS
 RZEu3+Q9wbVGsveMMUsy5qd5XoTxYtuXI1kZOIcug9SfuaZ5p/Zz20KNfnwuVnD03RYMTqQsggb
 ngajm5JSQDZ7PQ23B+6eZBshh8A==
X-Received: by 2002:a05:620a:28cf:b0:6b5:e32f:febb with SMTP id
 l15-20020a05620a28cf00b006b5e32ffebbmr13553579qkp.258.1661203114669; 
 Mon, 22 Aug 2022 14:18:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6+9qLo83O0mLbsZyHDek2m8yS+QZB9LX8Ukv8aD4lC2dlCzOu/Y8OucuLSKNaJGJ6EQi+vUQ==
X-Received: by 2002:a05:620a:28cf:b0:6b5:e32f:febb with SMTP id
 l15-20020a05620a28cf00b006b5e32ffebbmr13553561qkp.258.1661203114420; 
 Mon, 22 Aug 2022 14:18:34 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 l8-20020ac84cc8000000b0031f0b43629dsm9328941qtv.23.2022.08.22.14.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:18:29 -0700 (PDT)
Message-ID: <c10b243a7be185ba119bdfce9a46e609db3bdd3b.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Date: Mon, 22 Aug 2022 17:18:28 -0400
In-Reply-To: <CACO55tuw_2QWFMr0t6-JfUiQ4M7V3ZMKC7jHYTyERypaU3TekQ@mail.gmail.com>
References: <20220819142519.5684-1-mario.limonciello@amd.com>
 <CACO55tuw_2QWFMr0t6-JfUiQ4M7V3ZMKC7jHYTyERypaU3TekQ@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [RFC 0/2] Stop the abuse of Linux-* _OSI strings
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
Cc: ddadap@nvidia.com, hdegoede@redhat.com, nouveau@lists.freedesktop.org,
 rafael@kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 kai.heng.feng@canonical.com, Dell.Client.Kernel@dell.com,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 2022-08-19 at 17:44 +0200, Karol Herbst wrote:
> On Fri, Aug 19, 2022 at 4:25 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> > 
> > 3 _OSI strings were introduced in recent years that were intended
> > to workaround very specific problems found on specific systems.
> > 
> > The idea was supposed to be that these quirks were only used on
> > those systems, but this proved to be a bad assumption.  I've found
> > at least one system in the wild where the vendor using the _OSI
> > string doesn't match the _OSI string and the neither does the use.
> > 
> > So this brings a good time to review keeping those strings in the kernel.
> > There are 3 strings that were introduced:
> > 
> > Linux-Dell-Video
> > -> Intended for systems with NVIDIA cards that didn't support RTD3
> > Linux-Lenovo-NV-HDMI-Audio
> > -> Intended for powering on NVIDIA HDMI device
> > Linux-HPI-Hybrid-Graphics
> > -> Intended for changing dGPU output
> > 
> > AFAIK the first string is no longer relevant as nouveau now supports
> > RTD3.  If that's wrong, this can be changed for the series.
> > 
> 
> Nouveau always supported RTD3, because that's mainly a kernel feature.
> When those were introduced we simply had a bug only hit on a few
> systems. And instead of helping us to debug this, this workaround was
> added :( We were not even asked about this.
> 
> I am a bit curious about the other two though as I am not even sure
> they are needed at all as we put other work arounds in place. @Lyude
> Paul might know more about these.

Some of the _OSI strings are totally fine. From my recollection:

[    0.242993] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
^ this one is needed to do a couple of ACPI tricks at startup to get the PCIe
device for audio on nvidia's GPU to be detected properly

[    0.242993] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)

I don't actually know how necessary this is, but I'm hesistant to call this
one bad as it may be related to the funny mux configurations that I'm learning
may exist on HP machines.

> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

