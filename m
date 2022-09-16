Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0052F5BEF1B
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 23:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1659C10E7A6;
	Tue, 20 Sep 2022 21:24:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7D310EBE9
 for <nouveau@lists.freedesktop.org>; Fri, 16 Sep 2022 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663327501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWT1aNW0ZX4uFyjwmsjPL1bKB9oSfjQTT8f6OZuNFHg=;
 b=dSxU7r7329dN0FoTAdkyh3qUZOU6nG/bqQIxlm5GOkHSGwae/K+/pRdzfuDdqyWbxeJDeF
 k+fV/mIiTJUxgrHwtYqR260lW/izgftwANPTChAyjeqkQL24yc3JUvncaoAPHLJ9t9bAb1
 121T7sBpq4bjW7iI8OcqtWrqsJjPO6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-3PGcCdTqNTisPFTWzcrUlg-1; Fri, 16 Sep 2022 07:25:00 -0400
X-MC-Unique: 3PGcCdTqNTisPFTWzcrUlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f25-20020a7bc8d9000000b003b4768dcd9cso6411435wml.9
 for <nouveau@lists.freedesktop.org>; Fri, 16 Sep 2022 04:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FWT1aNW0ZX4uFyjwmsjPL1bKB9oSfjQTT8f6OZuNFHg=;
 b=gKYB+fH0BgFuUJl8I5DlGDHBn2sHk9opXbnVm3p5ORR8nnaRiGvfgnrU96p7Jzn4EZ
 w9+uNHf+iNJ04zlCyQU0oK4vbz1MNNTSqKjMhCWo4THBYDiXk7l5qrIF8rbNG5NmVh7A
 N5NHFqephjqnIWQ310YWzBS9FsCwmbhGiNBjVo6AC9fWEEiB73s1o8B0tvu2Wlp/KXYg
 CuTDimbNdKT6PN4qBO4W2rgt++MCrYwKO7W+3JDZoK6+sx9wm5I3zEF13FwjpmbnuVnp
 ivCsa79SJtZpOUZxQT/G/+Xs3MojfJXXRHxjzTC5kANgkdpcakQ7zIUhmX1HxVb9E+47
 pHeQ==
X-Gm-Message-State: ACrzQf1c1EBHVQsuQsvkocP6uO76KtjxGcWyXfy6poKbGNwttCRSMPcP
 cly6eU1IFGczmVH0lV3KVcL14zOETKWrwBh0AeQ+w7kIrFKAGslyPHDH0RhIgsSZ8R5YOpLrZPH
 NJts1G/Kpme9JNlOfQ4hwhTTmgg==
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id
 y3-20020a1c4b03000000b003b474d3b4c5mr2953796wma.96.1663327499415; 
 Fri, 16 Sep 2022 04:24:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n/5/jPTh15owYiIdxqtDHEqMzxYlB4BIVX5SyvX66tGS3HAdFaQlivz6iDfYJgd4mjkRCCQ==
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id
 y3-20020a1c4b03000000b003b474d3b4c5mr2953782wma.96.1663327499183; 
 Fri, 16 Sep 2022 04:24:59 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k2-20020a7bc402000000b003a5c999cd1asm2275331wmi.14.2022.09.16.04.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:24:58 -0700 (PDT)
Message-ID: <4d492346-36fc-a230-4112-e182caa158af@redhat.com>
Date: Fri, 16 Sep 2022 13:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Sep 2022 21:24:04 +0000
Subject: Re: [Nouveau] [PATCH 4/4] drm/plane-helper: Provide
 DRM_PLANE_NON_ATOMIC_FUNCS initializer macro
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
> Provide DRM_PLANE_NON_ATOMIC_FUNCS, which initializes plane functions
> of non-atomic drivers to default values. The macro is not supposed to
> be used in new code, but helps with documenting and finding existing
> users.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

