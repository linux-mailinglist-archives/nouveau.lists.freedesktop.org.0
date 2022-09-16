Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC95BEF16
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 23:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D0610E2B2;
	Tue, 20 Sep 2022 21:24:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955B410EC1D
 for <nouveau@lists.freedesktop.org>; Fri, 16 Sep 2022 11:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663327419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZQH9PFYSxgOPoALsHsE/rErasChde24zrfOYiDyTX0=;
 b=Z8K3Svi1AvM03h76LevotR7CJkPRDPs2yKVTRe8wBj3j60RuU6Eoeh0IjSltmrQjPM0mjn
 qHwdqi+/LbCdwN0EwDZ5KLemJs5YIjrTmRn7MTF1WUuhY9vQWd2pn4hgHl19Zh84kTlaZZ
 npODHEWXnzBY/ZkNGCow5exXsjTtQqw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-kTdoePTwNIqefzuKHJLzkg-1; Fri, 16 Sep 2022 07:23:36 -0400
X-MC-Unique: kTdoePTwNIqefzuKHJLzkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 q16-20020a1cf310000000b003a626026ed1so7620023wmq.4
 for <nouveau@lists.freedesktop.org>; Fri, 16 Sep 2022 04:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0ZQH9PFYSxgOPoALsHsE/rErasChde24zrfOYiDyTX0=;
 b=UgMi6ujV5oD3zgZ0m6MMciGeEe1mzQwrOfO2jLs38WGPSPN6SoYg2+3wz771zm6olK
 hsDbxAj7evXIBEyY4Y/olTWcG6fD2M3OM2k5knxgVfH4yDKPkyobfunInL/wxz1+Ph2I
 yc9xFvxBJWdjTkKLupWr3WO1A+dAVMM8Jz+LXudMDMOmqISmRnOyAAJMtZrgOWOriE4Y
 Y3hV0xZzdz0W2gY/Ly3d1Z2EHBVYy77sKZ0cicrA4mbbBoasFHKQzpslfqXsqJbnIEwl
 V7Oer0OvqZu2V+2XKLnkYAPAg35LXfeKmH3jJKOBDKlYI21TUcYXrCCWB2hIwsCdYsCZ
 Awkg==
X-Gm-Message-State: ACrzQf1igKijPOYhUuy3LWT9oeN18FRIHAMwTOjFNsao1pjhST1KIgbx
 dNfcVEe2aTo8QhaVMPlgv/8g6sJpT4asD37F+pjJZzm4vQiYKVm3qoR8VLB3oThMxWSytCUeXfw
 SGXWV694u6RSD8bUzPTOvV+PecQ==
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id
 m5-20020a5d6245000000b002253e24e5b1mr2594330wrv.698.1663327415720; 
 Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rSqpUyp7t2tSW+U9ofrvqVJDHxMOvNBeGFF95LaCwlhrl5+FPdJsu1AfyyGVP8rZkzhUPzg==
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id
 m5-20020a5d6245000000b002253e24e5b1mr2594316wrv.698.1663327415543; 
 Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b0022a9246c853sm4779510wrr.41.2022.09.16.04.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
Message-ID: <cf3b577b-c284-867c-8450-b791eb746176@redhat.com>
Date: Fri, 16 Sep 2022 13:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Sep 2022 21:24:04 +0000
Subject: Re: [Nouveau] [PATCH 3/4] drm/plane-helper: Warn if atomic drivers
 call non-atomic helpers
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/9/22 12:59, Thomas Zimmermann wrote:
> The plane update and disable helpers are only useful for non-atomic
> drivers. Print a warning if an atomic driver calls them.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

