Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF76640DD
	for <lists+nouveau@lfdr.de>; Tue, 10 Jan 2023 13:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC1110E5B6;
	Tue, 10 Jan 2023 12:49:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3573410E108
 for <nouveau@lists.freedesktop.org>; Tue, 10 Jan 2023 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673354991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7tgKM20DsrNx637VF4CpQec8L0nTnjIQhsUYzDVSoo=;
 b=TP7Jq7I0097PiFLcOWlS4LxN+y/++FxTWesnEZjqS0sAXGAwWRflUv2dDN8TxnGjx7YGJX
 u5UZ1H3nD5AOxLsKYTn2g9BTUQty2cDjfk4YqdfL0rLM3O//fZ0cbYsT6Q+aLBKXcO8co5
 ds+K1N8dN4e3oyymcVb0ssYUrU6Dfo4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-ot9V3YG0MBmtMC9hwG3Ekw-1; Tue, 10 Jan 2023 07:49:50 -0500
X-MC-Unique: ot9V3YG0MBmtMC9hwG3Ekw-1
Received: by mail-wm1-f71.google.com with SMTP id
 21-20020a05600c021500b003d227b209e1so2505910wmi.1
 for <nouveau@lists.freedesktop.org>; Tue, 10 Jan 2023 04:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a7tgKM20DsrNx637VF4CpQec8L0nTnjIQhsUYzDVSoo=;
 b=R5NiBlkHSBphuwfe8k3+8PgM3aKuNW5dvuvEllaZKzno/MBNn2xyu6sHIicTYor11o
 ity8kOnt7ymJEiwqvJNfhvbPMk1XNe2s+F09QQ8NpJaoTvuruCLPXof4jthYJ0CK69am
 Kz9vDb+z+G+HWJLpoTHyrrtZ9U+/jJnQR4/qjW6DFkjg48biTRmESW7ZXht77x0WAKCm
 9E9+1z+IDs4rgZ1v7yapeIeHWpTMl1dtWlz2diTL0QcM0LU2RpMNNgcqai0r7RQquJfF
 CDZzvU6jxzuqa3/Dnbuy9MmHsR3gtMX6Oung6W0+npbey03cbgHA6MbUR2Fhc2PQJoaQ
 kj/w==
X-Gm-Message-State: AFqh2kpybDMiWtr2zCeCv6ipVSYEiwxrwojwKklr8rDUfbwW3urPY0EE
 JDwUyOTCLtU6JilnUMQcC1gI/6If36QvfbWMLkMaKeP1gH/ipvfaXApKnSiuqcMy0Wqt6fG0KUb
 ZUzNuqL+A84n0zZO/GQqsH7hEFg==
X-Received: by 2002:a1c:ed19:0:b0:3d3:52bb:3984 with SMTP id
 l25-20020a1ced19000000b003d352bb3984mr50092086wmh.17.1673354989022; 
 Tue, 10 Jan 2023 04:49:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtCf5TAPAxZ3JxoE3rUo+OdTsS8gxdWrF9oAxkZz+a5XUyyGeKMFqiYs8eTs+Zw2Iyx2zWpg==
X-Received: by 2002:a1c:ed19:0:b0:3d3:52bb:3984 with SMTP id
 l25-20020a1ced19000000b003d352bb3984mr50092069wmh.17.1673354988798; 
 Tue, 10 Jan 2023 04:49:48 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c22d000b003b4a699ce8esm18214893wmg.6.2023.01.10.04.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 04:49:48 -0800 (PST)
Message-ID: <da2e0a51-9f75-cf74-9244-fd7b82dda7c5@redhat.com>
Date: Tue, 10 Jan 2023 13:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Thomas Zimmermann <tzimmermann@suse.de>, bskeggs@redhat.com,
 kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230110123526.28770-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230110123526.28770-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Remove file nouveau_fbcon.c
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
Cc: Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Thomas,

On 1/10/23 13:35, Thomas Zimmermann wrote:
> Commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> converted nouveau to generic fbdev emulation. The driver's internal
> implementation later got accidentally restored during a merge commit.
> Remove the file from the driver. No functional changes.
> 
> v2:
> 	* point Fixes tag to merge commit (Alex)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Fixes: 4e291f2f5853 ("Merge tag 'drm-misc-next-2022-11-10-1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next")

I believe the fixes tag should be before the S-o-B ? At least that is
the case in most commits and Documentation/process/maintainer-tip.rst
example. But you could fix it just before applying.

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

