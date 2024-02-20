Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F8485C548
	for <lists+nouveau@lfdr.de>; Tue, 20 Feb 2024 20:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C5010E55D;
	Tue, 20 Feb 2024 19:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H/+X2zp4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACFF10E559
 for <nouveau@lists.freedesktop.org>; Tue, 20 Feb 2024 19:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708459004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAzwB40fnjm/y6jvHQi3ZydEtaEfLQXv4AB7GQySHkA=;
 b=H/+X2zp4P7ZqRvI5D3EnJ76IzkngjcD9EHorAeYk8XMiJ49/fg6WUzmLT5SzdBZaMkAl91
 Jb8stcHp6ItNdflaQf4lXHta6uOfPqup3As1s3kktPX7lYWnqn+QPcF/3FjTvSLXZk9aKG
 u7PvB6LPP6tNN+ALCv9gKj9wya/U1Ag=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-t3wgYKC-OES3fz_kLlxvlw-1; Tue, 20 Feb 2024 14:56:43 -0500
X-MC-Unique: t3wgYKC-OES3fz_kLlxvlw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a2bc65005feso417479566b.0
 for <nouveau@lists.freedesktop.org>; Tue, 20 Feb 2024 11:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708459002; x=1709063802;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HAzwB40fnjm/y6jvHQi3ZydEtaEfLQXv4AB7GQySHkA=;
 b=ZilXNRZalg9ih4xadTVPM8pRQ0XJq+PgP0docDi7FK4rY2OUB2/4woXSpmArP0gvmM
 QgVx2seoEcQg6WyegjBoT9a3vSuGE1kGYA1zk09eQ46jCOb90krS7bQ+RG3p3vkr/qiO
 d9FaT2GOnGf2QBEsveLTpWeZwHG5is1pvLBqFKWWbb8wTB6Wk821C1GPyzSQXvVWSfQU
 3SeI4XT5YT5WvLqGDxXre/Z4cMsbDqDrRcM+tYbtgOdS54X33XBgsB01E1U+cxDDtJ5q
 83f86HV0FEesdJX43J6/erQOXvizO2d5s+tijQrHGI/DO0zwk500uTOOTrAaf/zTmfgV
 1zkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXynLKrPVRWpYrjerVMV28b+SWYDhG5Y7SAhj50YQ44ciwfdzmgpMUFOh/WFdyt4dT0gmagMO/TV2RhfbyVK/kq5MeoN80hU/aF9ODL7Q==
X-Gm-Message-State: AOJu0Yyb9r29ejX4tc3JPrixwezunyZiAdj6jDvzB9Ienxj6YKidZByw
 AjmlaApqJQHu9TDFILrwxLrP93opNskwEnncfb8v6T0WgOLZifmoLhIOEe9OnwRjXT3QAlEdiCR
 Hx5QoVG8n3u+E7bpzCXsoBD6QgGvTBlMg3LXWHKMekA/3JPCeG2vld/s9HvueFKM=
X-Received: by 2002:a17:906:c28e:b0:a3f:33e:9ecb with SMTP id
 r14-20020a170906c28e00b00a3f033e9ecbmr1911765ejz.32.1708459002070; 
 Tue, 20 Feb 2024 11:56:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM38w6ltW43h2HtuKViTOg+ZuUCJZLp8g3kS7YXE6WNMUydHxX1zOJmuqKdRy5sWSkib3gkw==
X-Received: by 2002:a17:906:c28e:b0:a3f:33e:9ecb with SMTP id
 r14-20020a170906c28e00b00a3f033e9ecbmr1911754ejz.32.1708459001850; 
 Tue, 20 Feb 2024 11:56:41 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 lu16-20020a170906fad000b00a3d5efc65e0sm2941765ejb.91.2024.02.20.11.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 11:56:41 -0800 (PST)
Message-ID: <948bb935-aa24-4bb0-ba1c-30d1da78023e@redhat.com>
Date: Tue, 20 Feb 2024 20:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "airlied@gmail.com"
 <airlied@gmail.com>
References: <20240202000606.3526-1-dakr@redhat.com>
 <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
 <0cabb3e4e1f00dd0b0b3328a4da9bc8fa3ba6929.camel@nvidia.com>
 <01ff9bf5-0206-4d5c-b799-6213529fc26b@redhat.com>
 <2ac14f50f2286f2b440e3a124eb1763e91d513de.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <2ac14f50f2286f2b440e3a124eb1763e91d513de.camel@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2/20/24 20:45, Timur Tabi wrote:
> On Mon, 2024-02-19 at 10:32 +0100, Danilo Krummrich wrote:
>>> Looks like I spoke too soon, I just hit the problem with the drm-next tree.
>>
>> Did you apply the patch to drm-next?
> 
> Ugh, you're right.  I don't how I got confused, but I could have sworn that I saw your two patches in drm-next, but they are not there.
> 
> Sorry for the noise.

No worries, thanks for testing! :-)

