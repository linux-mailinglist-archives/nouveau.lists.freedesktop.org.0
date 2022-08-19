Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE1599EC2
	for <lists+nouveau@lfdr.de>; Fri, 19 Aug 2022 17:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C3210EBC9;
	Fri, 19 Aug 2022 15:45:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B0210F371
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660923900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5fwWxYPKfIyLb1AtYH/Z3aEi33LuJRO9uvJrZeR5HOo=;
 b=LDKxeBDn+mL340yl0emz7SeJ32OVXdMr4oaarcDMa4tn233QyKOwY/5DDm05Xt3EejyqKM
 Kwv27Ys7FD1G/LEIzkjlji6Dk6brte89z0JUqNlTTWQgW5TZVvYK6CeJ/ciKPhDmG9YWsk
 uFWKuQVwhwFLPZlr23hIYMI7hUOsQ+o=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-BG4rzKWAOuquJuvC1g0FdQ-1; Fri, 19 Aug 2022 11:44:59 -0400
X-MC-Unique: BG4rzKWAOuquJuvC1g0FdQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 dc13-20020a056214174d00b0047b6f9a1a9aso2987065qvb.23
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 08:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5fwWxYPKfIyLb1AtYH/Z3aEi33LuJRO9uvJrZeR5HOo=;
 b=avcbEYQSn/oqE9xkkSXqpLQtuRjpgARdE+J8COgn1Ku6Px2fyP8EjvtF3ifZNYcFNG
 89ZsIn2ETDx6FdjpNrupRJpWPHwYVmtQNj/OfwGhwLqs5X7bIlBVDJNstqZOn5k8uw7p
 5CKPl3sFsNtms0G0WX1n08rgP5zEO14Qm4r2w4A1wcGf04eccF2BAUn3QUmONvovs5ce
 tuOo8vL1DSJibu7nj7QSHEXqFAJQbBWSxp1EgcyabO866ymXBVWExypFb9MFxFBwRpTQ
 zom4ejdWnlHcHsGkJb91V09iWMd3izgDgI1eCo5SOd3p0zD+IynDapbUW379DN2xNh4S
 /Ytw==
X-Gm-Message-State: ACgBeo3XvWgVwRPAqMGQNBb1feNw9rcBWEmWKxwXolPT7e+ddKFedhvf
 UtZDmekvf3D41tosFrShf4k5G0ypr/L/EtZ4O5lv3sH8AYoms5JUSZXIQ5jSkKUS8T2QYkEKwav
 c8lVMjZObDyiePjiDffQPzaFb6dPcpC8i34fHQN/6Zg==
X-Received: by 2002:a0c:b309:0:b0:496:6277:953e with SMTP id
 s9-20020a0cb309000000b004966277953emr6978202qve.77.1660923899231; 
 Fri, 19 Aug 2022 08:44:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Hc2ZOCME0gpn+lc9a9OvgTyIXKsg/yLvVyJ8pQTmNOIEsbnWTS8GP9R4XmCi9QIDfpVs6VLTm+SlaDkSJT4M=
X-Received: by 2002:a0c:b309:0:b0:496:6277:953e with SMTP id
 s9-20020a0cb309000000b004966277953emr6978190qve.77.1660923899005; Fri, 19 Aug
 2022 08:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220819142519.5684-1-mario.limonciello@amd.com>
In-Reply-To: <20220819142519.5684-1-mario.limonciello@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Aug 2022 17:44:48 +0200
Message-ID: <CACO55tuw_2QWFMr0t6-JfUiQ4M7V3ZMKC7jHYTyERypaU3TekQ@mail.gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Aug 19, 2022 at 4:25 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> 3 _OSI strings were introduced in recent years that were intended
> to workaround very specific problems found on specific systems.
>
> The idea was supposed to be that these quirks were only used on
> those systems, but this proved to be a bad assumption.  I've found
> at least one system in the wild where the vendor using the _OSI
> string doesn't match the _OSI string and the neither does the use.
>
> So this brings a good time to review keeping those strings in the kernel.
> There are 3 strings that were introduced:
>
> Linux-Dell-Video
> -> Intended for systems with NVIDIA cards that didn't support RTD3
> Linux-Lenovo-NV-HDMI-Audio
> -> Intended for powering on NVIDIA HDMI device
> Linux-HPI-Hybrid-Graphics
> -> Intended for changing dGPU output
>
> AFAIK the first string is no longer relevant as nouveau now supports
> RTD3.  If that's wrong, this can be changed for the series.
>

Nouveau always supported RTD3, because that's mainly a kernel feature.
When those were introduced we simply had a bug only hit on a few
systems. And instead of helping us to debug this, this workaround was
added :( We were not even asked about this.

I am a bit curious about the other two though as I am not even sure
they are needed at all as we put other work arounds in place. @Lyude
Paul might know more about these.

