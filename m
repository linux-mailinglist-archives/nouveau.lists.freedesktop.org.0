Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F407AF74B
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 02:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADBA10E451;
	Wed, 27 Sep 2023 00:18:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B442710E44E
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 00:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695773915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfUoRGmtmsURMuZ/ZaWqNBwx4yTWCRZeeYiles99YKA=;
 b=SlxBlGBsqXZ1tUPuvdEvbdwvO6rHCgovxpL0cr43TvxOg25srNZF9pRvItlTyDOmf8UYK2
 odannB4hN43Yb6lfoEjEEzqzta0ezhr0DyankNEe89YA00rPawBi8mRETWw3ez7/t3rEbo
 nSB52AsvtkTn02X7bapZuOWpIe0+ZpU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-nj09IEfTMv-n1UoCN04FiQ-1; Tue, 26 Sep 2023 20:18:34 -0400
X-MC-Unique: nj09IEfTMv-n1UoCN04FiQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9a9f282713fso805519366b.3
 for <nouveau@lists.freedesktop.org>; Tue, 26 Sep 2023 17:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695773913; x=1696378713;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZfUoRGmtmsURMuZ/ZaWqNBwx4yTWCRZeeYiles99YKA=;
 b=TgbaStppwUE7AjG8IPNZ2JtF2GGlet4ec60O2ZL3igenQ4vh0zkxOiyeuEBOFAfbHJ
 rWAPTLMtc4qM2tt8nZo7bD8vmJy7Ya+WNszMzrV8Ft4EP/TcdsDD/JNsps6VAHGP9fb1
 fxCLLjjdj74Bngq0V7/G2mzZyVQBiJ5ZyMZaggCH+VyXmudrAtZBqqsg6Y8jUj8OGhpH
 nk9ayF0GnA8SqIuE8qlkDnCTAuDukoxMVQw7FJGZ08xS8oVLVJLvxujPLPYbU+3ZKF6q
 jYUHJ+tlKSt9NFfveBqAIl+SW3Kdn06UH0PZDeT2Jy+Qhv9s8X6JvzAD2qVJWVLmFE2k
 EgfA==
X-Gm-Message-State: AOJu0YyVdw3ujkJTfQESWhpylAcvC3EwSpuYH/ahhbzUkDkVx9nYxQ/B
 4uIKyTg2xmNas4D00lfuJ2wpTk/cXAhxSw8rprV8iZK+5F5Quwk6d+nozP/bWiwQUE2Y5ug+uoI
 fs4gJXEgvyiURISg60iAarR97bA==
X-Received: by 2002:a17:906:18aa:b0:9a1:e758:fc73 with SMTP id
 c10-20020a17090618aa00b009a1e758fc73mr198558ejf.67.1695773913376; 
 Tue, 26 Sep 2023 17:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+wIMu+OJK6/VompfluO9KYwsYp0o7+KpOhz1siwgDos3xBjAIZ2dWHdrm0YJEKFaJIu47TA==
X-Received: by 2002:a17:906:18aa:b0:9a1:e758:fc73 with SMTP id
 c10-20020a17090618aa00b009a1e758fc73mr198539ejf.67.1695773913005; 
 Tue, 26 Sep 2023 17:18:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a17090671d600b0099bcdfff7cbsm8369150ejk.160.2023.09.26.17.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 17:18:32 -0700 (PDT)
Message-ID: <2b062434-fcbd-de2b-decd-5000b63c2e6f@redhat.com>
Date: Wed, 27 Sep 2023 02:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Luben Tuikov <luben.tuikov@amd.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
References: <20230924224555.15595-1-dakr@redhat.com>
 <312983ee-ba4c-477e-8846-072c815df862@amd.com>
 <f6294659-042d-46eb-ae6e-716a6c51872d@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f6294659-042d-46eb-ae6e-716a6c51872d@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-misc-next 1/3] drm/sched: implement
 dynamic job flow control
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 9/27/23 01:48, Luben Tuikov wrote:
> Hi,
> 
> Please also CC me to the whole set, as opposed to just one patch of the set.
> And so in the future.

There is no series. I created a series in the first place, but finally decided to
send this one and a few driver patches separately. However, I just accidentally
sent out the wrong one still containing the "1/3" addition.

- Danilo

> 
> Thanks!

