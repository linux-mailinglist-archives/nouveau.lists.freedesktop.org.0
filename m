Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6B44464D5
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FE26E8E2;
	Fri,  5 Nov 2021 14:25:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202176E9BD
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635944951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHMsC1oUCRsjBOtz0WOghUbDKMYwj98GGeuEKoCFpno=;
 b=abgZHe6Tw/GWZ3AK5JIx7HQmcDDmZYd/pczhOUfbDAkL6X6ImtpEQAo1gSgYmyhrRcYRES
 8fnCQ+3hhpBznoAzjDyIS35lVn0thYFgt+FMyFpANnBPqgIC7DE6N3G/V7JT7DoB+3qa68
 FR3CXzAtUi3NybSnUiqPUZ3BNZKJK3s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-u9oQ0jcaNXSO4s5mx3sFQw-1; Wed, 03 Nov 2021 09:09:10 -0400
X-MC-Unique: u9oQ0jcaNXSO4s5mx3sFQw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so1035032wmj.7
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 06:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iHMsC1oUCRsjBOtz0WOghUbDKMYwj98GGeuEKoCFpno=;
 b=W+9w7CElkmq0GseHhC8K9w1GLFVnauVmtCz78TYkvX4VyvznSMkJ6twlIvI0xPcLWU
 1SZDmUb8ynPnEH/FrZAT7JO1F5TyTXO2ns84w7XUvEO/5P5zvyFVsTxM2uj2rFoCltKQ
 Uu0qpABvoe7Ox87iKgndL+a7daojhPLD4TWuVmf1KcY+Eu2Nz1CFQiZYbqjOWRksajqR
 Y9unpXyzgQ00h2s2yEDRlLXBigKyY9e8GymjnNhufZNMVDmI8kh9u15jGovBdaA1IKdH
 GAyaJX8Hfa3x3qhkqWmFOX0P5fxr4wfiNbTWKcu7HJLB1L79HMDQzVzbjSBw2Ti3KMtJ
 Pkwg==
X-Gm-Message-State: AOAM533nn7WAs7Wv4r+5rSP0wOyE3Mj0pa1oGdEDMYzCnH0q/CKCIAFv
 QloSq/hfOxbOoC5MWAP2OB0jHIcoVdM64NGAKKskNxWccDdttHxcCKMrYbdxyg6mPzrUy+5ceUV
 iOQ7rEhnEBoXC5VygN86mmzpm2w==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr31884110wrw.312.1635944948941; 
 Wed, 03 Nov 2021 06:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHrEigoCAeSjtml4DqbOgRDb3rC6POB4cYQ/OE3/fS74/sMET7hHGSgDw+3c9Pc+WnqHoSzQ==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr31884038wrw.312.1635944948667; 
 Wed, 03 Nov 2021 06:09:08 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id c11sm2186397wmq.27.2021.11.03.06.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 06:09:08 -0700 (PDT)
Message-ID: <33807d3c-9dd1-241a-ad23-0e0d4fba13e1@redhat.com>
Date: Wed, 3 Nov 2021 14:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-3-javierm@redhat.com> <87tugtbdob.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87tugtbdob.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 05 Nov 2021 14:25:38 +0000
Subject: Re: [Nouveau] [RESEND PATCH 2/5] drm: Move nomodeset kernel
 parameter handler to the DRM subsystem
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Jani,

On 11/3/21 13:56, Jani Nikula wrote:

[snip]

>>  
>> +obj-y += drm_nomodeset.o
> 
> This is a subtle functional change. With this, you'll always have
> __setup("nomodeset", text_mode) builtin and the parameter available. And
> using nomodeset will print out the pr_warn() splat from text_mode(). But
> removing nomodeset will have no impact if CONFIG_VGA_CONSOLE=n as that
> leads to vgacon_text_force() always returning false.
>

Yes, that's what I decided at the end to make it unconditional. That
way the same behaviour is preserved (even when only DRM drivers are
using the exported symbol).
 
> To not make functional changes, this should be:
> 
> obj-$(CONFIG_VGA_CONSOLE) += drm_nomodeset.o
>

Right, that should work.

> Now, going with the cleanup in this series, maybe we should make the
> functional change, and break the connection to CONFIG_VGA_CONSOLE
> altogether, also in the header?
> 
> (Maybe we'll also need a proxy drm kconfig option to only have
> drm_modeset.o builtin when CONFIG_DRM != n.)
>

See my other email. I believe the issue is drivers/gpu/drm always
being included even when CONFIG_DRM is not set.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

