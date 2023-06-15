Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A6731DF9
	for <lists+nouveau@lfdr.de>; Thu, 15 Jun 2023 18:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C264A10E515;
	Thu, 15 Jun 2023 16:39:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55910E515
 for <nouveau@lists.freedesktop.org>; Thu, 15 Jun 2023 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686847165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85Cde2lC1B5p+slsHblZ/ywkw9kOFzxqw+4KoOzSvts=;
 b=X3QeXZJ0RtvYoNO9SuP6yMVxqUZI0T+sfOuGeGuwhl9AkGtTEIv9O4bJBsq8kfSSqzvskE
 eJy30LQCeZA4vxK+Z3AaYN+C/tfjjKWB0CdE1KH2Qfp3+qTPh3iVALMyNI5uFweCxNBVPT
 kw1pMd7wlsL3Pno3SaqrBtNZ0X0m1yQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-Insdu_a-NGWj-1QgQ4W61g-1; Thu, 15 Jun 2023 12:39:23 -0400
X-MC-Unique: Insdu_a-NGWj-1QgQ4W61g-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-97542592eb9so177480666b.2
 for <nouveau@lists.freedesktop.org>; Thu, 15 Jun 2023 09:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686847162; x=1689439162;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=85Cde2lC1B5p+slsHblZ/ywkw9kOFzxqw+4KoOzSvts=;
 b=iRNJyeQRmWEpu/dO7fRQwxpLFJc5zZmLwDpH+O3fMqVpRzZ9vcoEElK+axYK7iPbZD
 nP6a9IJvlhxtJE0PQfpqaSnyiwpdqq7V0524W7Rn725jx1667KRr33y4YSgDsQlZvYGM
 ZNogf7KACAvq9GCKGIIAvz83SF7bzR4vhgwTSeBRQL00RqdmVPpckscHTnIioxoXb9W9
 /DvM7udwuD0qmVduQd3I+qgm/roM9GnMKzLWbFl6S5S29c53/L1Q025QAmH2OhSBuNbH
 FpHFLhQ7BkOxJSfCPjGF6cPtD8rNsu5z6kSvIpliHzYztmF/RB119tTk8LTCkaORtJSj
 2opQ==
X-Gm-Message-State: AC+VfDxQ2L9ay91U2+1Hy5q1WRKzrOsdSzJ85Y4ubxMxE7DZbWYOR/UT
 LfdNDTe352XYkaZ9eqWx+ec73eA7c/kgpMXUrQzE0KsCNJWuWacvWdL7dMyBNQVaz9tLJcawgTQ
 Ldn0L6iR7fEg4JbBkzeYg+Bob0g==
X-Received: by 2002:a17:906:478f:b0:96f:aadb:bf81 with SMTP id
 cw15-20020a170906478f00b0096faadbbf81mr20890722ejc.45.1686847162690; 
 Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HFzj8oji+QgifVAS8W5rrkeLVzDVniPUlQYTVJZN7par6lelAUrI2LEXLSV910896GtiXog==
X-Received: by 2002:a17:906:478f:b0:96f:aadb:bf81 with SMTP id
 cw15-20020a170906478f00b0096faadbbf81mr20890694ejc.45.1686847162404; 
 Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170906684d00b0096f7500502csm9582514ejs.199.2023.06.15.09.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
Message-ID: <68cd25de-e767-725e-2e7b-703217230bb0@redhat.com>
Date: Thu, 15 Jun 2023 18:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Liam.Howlett@oracle.com
References: <20230606223130.6132-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager &
 Nouveau VM_BIND UAPI
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
Cc: matthew.brost@intel.com, willy@infradead.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 bskeggs@redhat.com, alexdeucher@gmail.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 6/7/23 00:31, Danilo Krummrich wrote:

>    Maple Tree:
>      - Maple tree uses the 'unsinged long' type for node entries. While this
>        works for 64bit, it's incompatible with the DRM GPUVA Manager on 32bit,
>        since the DRM GPUVA Manager uses the u64 type and so do drivers using it.
>        While it's questionable whether a 32bit kernel and a > 32bit GPU address
>        space make any sense, it creates tons of compiler warnings when compiling
>        for 32bit. Maybe it makes sense to expand the maple tree API to let users
>        decide which size to pick - other ideas / proposals are welcome.

I remember you told me that the filesystem folks had some interest in a 
64-bit maple tree for a 32-bit kernel as well. Are there any news or 
plans for such a feature?

For the short term I'd probably add a feature flag to the GPUVA manager, 
where drivers explicitly need to promise not to pass in addresses 
exceeding 32-bit on a 32-bit kernel, and if they don't refuse to 
initialize the GPUVA manager on 32-bit kernels - or something similar...


