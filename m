Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8E4464DF
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2026E90C;
	Fri,  5 Nov 2021 14:25:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2282D73612
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwI0Y59Q5jmF4PHv+uLDkwhNmEWKp2IZoCsuOpcoatA=;
 b=V8hupRDi7JW+MC8owgkOu+/x5Qo5KaggJE3sSIstfNGwbQoL9+gRulz1GWQFi/8GxGc41a
 enkqUtLyhFFkpJTFmMNpm+gZLs/uvyOcF+btSBtMsx0ql6i57D9Ot9z146O6p1kWLNpk7M
 zPe2NrI7r68797d6wlshTQaNDptLT/A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-ngyQvGOAN3iKYVg6wKJccQ-1; Wed, 03 Nov 2021 11:00:51 -0400
X-MC-Unique: ngyQvGOAN3iKYVg6wKJccQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so1192510wmj.9
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 08:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uwI0Y59Q5jmF4PHv+uLDkwhNmEWKp2IZoCsuOpcoatA=;
 b=zwDZtS04BLn1ZQJGht7PD0LffXCSHrbPwN3E+9Jf4yJ0nzXRlA0O1ZCZSD/i1vMbzT
 cjOLeqV0PPojVBIPkpOZGKufV08yXckE41S+cX2pC2ckxWOf1vExyULzgxg3vtlJWkYH
 tE9VWdzGlq7hFUL+Xl0abCPCIAoE3+y2ZpHHD9MLE551uW0nWBh6Ut2ONKYQfGZtYVkp
 SPFoU7nSEEU25tZ4monfm80AMNbNvh3MrJ5CglTyyF0rYhnn2mGTjh4UbYhnn2MK+Jre
 nDDDyj0zHyxuUm4Cnqyzc9YlScth0bPMHDlgjl3Al8waYkS6nMaQqpjc0K34z2CE+aYa
 TjqA==
X-Gm-Message-State: AOAM530SQ+D85FpbqqQLb3ZMyurzYzaCf6LbDxQlcNiZ8dERSUDn8fY8
 P8kh9OHt583gEBp2wYetulyBWFXBpcR9kKBsyWGKWjSqkrtGSV/m13zbHcuXN1zdWxPJlCJrLdE
 MUcqKbW7zDrAx2gKmfB9JQGQNLA==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr15702629wmc.109.1635951650014; 
 Wed, 03 Nov 2021 08:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlHYGSvfJmLDivVAOaT4xxbH7zmwqgCefExXH/bfigpAgkjWjbQ8meeoW65MqFlJvktgySGg==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr15702572wmc.109.1635951649817; 
 Wed, 03 Nov 2021 08:00:49 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q1sm2089857wmj.20.2021.11.03.08.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:00:49 -0700 (PDT)
Message-ID: <dbdbaf95-8625-aec9-4446-d39db77b23f2@redhat.com>
Date: Wed, 3 Nov 2021 16:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211103122809.1040754-1-javierm@redhat.com>
 <e02d23be-1a1c-570d-e76f-dbea76b6dd55@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e02d23be-1a1c-570d-e76f-dbea76b6dd55@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 05 Nov 2021 14:25:38 +0000
Subject: Re: [Nouveau] [RESEND PATCH 0/5] Cleanups for the nomodeset kernel
 command line parameter logic
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
 Jani Nikula <jani.nikula@linux.intel.com>,
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

Hello Thomas,

On 11/3/21 14:01, Thomas Zimmermann wrote:

[snip]

>>
>>
>> Javier Martinez Canillas (5):
>>    drm/i915: Fix comment about modeset parameters
>>    drm: Move nomodeset kernel parameter handler to the DRM subsystem
>>    drm: Rename vgacon_text_force() function to drm_modeset_disabled()
>>    drm: Add a drm_drv_enabled() helper function
>>    drm: Use drm_drv_enabled() instead of drm_modeset_disabled()
> 
> There's too much churn here IMHO. Please merge patches 2+3 and 4+5. And 
> I'd put patch (4+5) first, so you have the drivers out of the way. After 
> that patch (2+3) should only modify drm_drv_enabled().
>

Sure, I'm happy with less patches.

Thanks for your feedback.
 
> Best regards
> Thomas
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

