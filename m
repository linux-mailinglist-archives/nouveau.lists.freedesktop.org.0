Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE80BD7F02
	for <lists+nouveau@lfdr.de>; Tue, 14 Oct 2025 09:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A76C10E561;
	Tue, 14 Oct 2025 07:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OilukKMS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC1810E564
 for <nouveau@lists.freedesktop.org>; Tue, 14 Oct 2025 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2f+TEVmNHcIZWSH2C31Ng9eliwbtMBD5xTQThZ/PZk=;
 b=OilukKMSu42pV46NBFqbnT70tAnBSPt39yYIoREjDrDjti0kgBDOh0yIV/nOnfvaMkI0Uh
 ajmf39v7pWsGLFvz51N1b/n0KAF1fHu23RMdqf6Y4/uN25JS5dU9AieDfJV9B7EwGtce8L
 Bhuwi0MSeep25QnW19JUqRvEGOeF3IQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-V8Uy_mM8P4SuiQJ8zA2NoQ-1; Tue, 14 Oct 2025 03:33:54 -0400
X-MC-Unique: V8Uy_mM8P4SuiQJ8zA2NoQ-1
X-Mimecast-MFC-AGG-ID: V8Uy_mM8P4SuiQJ8zA2NoQ_1760427233
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e3ed6540fso33512105e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 14 Oct 2025 00:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427233; x=1761032033;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2f+TEVmNHcIZWSH2C31Ng9eliwbtMBD5xTQThZ/PZk=;
 b=Y1p2FRrLR+LTwVNe290usjrpfP5+XzIxNgOVwUnwN3g+fHKx7cuH1pGtW4/MVICtCc
 wVaCe36yipvVXoSFIHJfVgVkeu0ypBHJl5qIs2NIxYonTB23pCl7QSjVb7vHG2ElkUPt
 OM4ApanfTzHIrAUA+f0l9x1Gj1rDrSrT1AXploakSzq6K87GdnMRs1+oAVy4qJhaoJKA
 DrhcdGoz5ZgnOnhWUbXpOIQmboOWD9ot2zvDsdcAhE4aUkEE+oXHDQDdHzqhYVmZqDv8
 lfheVNw/aTXz2serLEdf6flJAq44CTHqKowZjU2vLgCApyKaPo3VPYxLgAu3Whh5YId/
 MYwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhu5L4p6W95/V5d+E9b43clS4agT0/tf/+bhgqfem0PUmQ+hW6xTzk4704X5pg+4LWqboDHKlj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWmgzQm0CZdNsuZ2dJsTfyh0f1mYxnxvr0YS2vNVxn99SDokiC
 yIKkYSMNdGxUM1wrtxHLqRJBVCllzuiBTprqmzk/AhJO2SWgoyBO6m+6m702yPeJbn7Hn45LCIS
 uX6spisViGbfagBFjRKgOyUC6m73yxx5I4v7xEzrUE8rBUD5WHzM+A/NPYJwoEy0BtEA=
X-Gm-Gg: ASbGncvd3ppbEwJAC6SJibT8k3V3BELcRDMujRYBl2ZTLIAHcrd0A+I9NLm4As56M8z
 gwCNWuoz42ybmKbTVYQhihfJ2E0WwEEfwHw/nivgPfaSnIFZDE4yLlzisvV8F/xj/UfASGjNwop
 54RSspkHwXInU7AS3JBPkrr6Fm5gL6sBUebgT0y6RAsqh4kXqQ8u5XkLK84To8LvhRZQRvr3FLo
 CYcmcXrZ0zcECo85nHWSn+3UlXGGPSBtnSeNMth+9XjZaAMx1TL5enW4NqfeUqWwV4BIECdwmj5
 TEJWqeRMPkxEqWE7efTTSy8wBiWXXHZpKXBVSpbieUtjqOQbbuKhBwp8ie3ri7xhmQr1T/7HZT1
 JLT9z
X-Received: by 2002:a05:600c:1277:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46fa2952c02mr135681035e9.3.1760427232804; 
 Tue, 14 Oct 2025 00:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBeNo7ZlnJvZO+4tdhdDmG+vIUKT7nCznXOA5q9opUrokbPvd9TwG1AFWjfUcvv1KmWXVDOA==
X-Received: by 2002:a05:600c:1277:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46fa2952c02mr135680875e9.3.1760427232370; 
 Tue, 14 Oct 2025 00:33:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ac60sm230694605e9.16.2025.10.14.00.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 00:33:51 -0700 (PDT)
Message-ID: <335fdb74-6d43-41e0-9774-eb57f425313d@redhat.com>
Date: Tue, 14 Oct 2025 09:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/client: Remove holds_console_lock parameter from
 suspend/resume
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, lyude@redhat.com, dakr@kernel.org,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20251001143709.419736-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251001143709.419736-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EYBespXsrkBoAs1Cpg7F49Mswcsmw4yy-CZNpED3fng_1760427233
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 01/10/2025 16:37, Thomas Zimmermann wrote:
> No caller of the client resume/suspend helpers holds the console
> lock. The last such cases were removed from radeon in the patch
> series at [1]. Now remove the related parameter and the TODO items.
> 
> v2:
> - update placeholders for CONFIG_DRM_CLIENT=n
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/151624/ # [1]

For drm_log:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

