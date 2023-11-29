Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C057FCCCE
	for <lists+nouveau@lfdr.de>; Wed, 29 Nov 2023 03:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2010E5DD;
	Wed, 29 Nov 2023 02:15:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E5410E5DD
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 02:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701224118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKn2JYUpqV3wbekajb5ZS+im7PxpappcmYXHnPLCMOg=;
 b=J5433omzfzB4G/x0ZNdxFjXMVOxE/PQEHMbNczMXThuxUPAc8RdcJfrfBldrc8AeqRrRho
 iCbVjRLDkUDwfbt+CWIPxpwNF8TJf394CEZjKWqeelxBxCSRKHmgnQI9MLu0f337HcNYk6
 Hcp2r2czeLcJBviFRNwt0XcSsBy8XwU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-JQYKpKyPPq2jQKYkQ-8N3w-1; Tue, 28 Nov 2023 21:15:17 -0500
X-MC-Unique: JQYKpKyPPq2jQKYkQ-8N3w-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5079a8c68c6so6022721e87.1
 for <nouveau@lists.freedesktop.org>; Tue, 28 Nov 2023 18:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701224115; x=1701828915;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XKn2JYUpqV3wbekajb5ZS+im7PxpappcmYXHnPLCMOg=;
 b=d4k7HYtjk43dVILASk5/yn+hKwEy5p0b23I+oEw58GhgRnLxPYYzBy3FWGzQeutxbR
 UVm7vm0JiZ/KNXU4jmwF0VYnwSWWPOhyiB6eWx0m+UiAZQedzD0P+zB4XsDuPGx9p4XX
 cbS+QV2fXod3mIC9DV2yKAUB+/ZBvpBnMCf4FOifPD5QLroapVV7Oo7Cz1nVbXP6K0xL
 EmTd/QOi2r5PWJu45uJGAE2uDEuFGz7cD0I6eqfdCsCDhUt8JZ//9qzj99fJNzYnPKXd
 im763RbObwN9wkdbSrJ/dGGb7fBQaPeVztQqfNFF7/PiqG1yHVeBv16RcMcnwj7c7ugK
 nVfw==
X-Gm-Message-State: AOJu0YwSaiqftzd88D+UkouHGgR3NWvPbKQj0BIqB47D448sCKPKJRuM
 7Tug4OE69KZLsGrh2jsDLzZ+ttC80C8qPEI8vuhTiIjWYqadU9W3H3CJV8qHD/56LpV18GX2Bpo
 Xh1ZhPpShmKGmnAMNOa55T8Bwng==
X-Received: by 2002:a05:6512:3196:b0:50b:aa13:a761 with SMTP id
 i22-20020a056512319600b0050baa13a761mr9265070lfe.46.1701224115756; 
 Tue, 28 Nov 2023 18:15:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS+WKRxrSYw288wOgG/cqzoj+euT0xS28Xc6/AGsdA9evhonP2l07Xitf1dqCow9oSCeSsQQ==
X-Received: by 2002:a05:6512:3196:b0:50b:aa13:a761 with SMTP id
 i22-20020a056512319600b0050baa13a761mr9265061lfe.46.1701224115460; 
 Tue, 28 Nov 2023 18:15:15 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090632cd00b009ca522853ecsm7358196ejk.58.2023.11.28.18.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 18:15:14 -0800 (PST)
Message-ID: <81ba79d1-8e7a-41d9-acaf-64f3eee1b97d@redhat.com>
Date: Wed, 29 Nov 2023 03:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Timur Tabi <ttabi@nvidia.com>, "gustavoars@kernel.org"
 <gustavoars@kernel.org>
References: <ZVZbX7C5suLMiBf+@work> <ZVZxXiXYIzEwUE3N@pollux>
 <6517a6a41eb72d16596c913dc56467e0390287a3.camel@nvidia.com>
 <4b10068c-4285-41df-b4bb-4c61ac70a30b@redhat.com>
 <f0662715-928d-4685-8f88-f2129eddab3c@embeddedor.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f0662715-928d-4685-8f88-f2129eddab3c@embeddedor.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/29/23 02:06, Gustavo A. R. Silva wrote:
> 
> 
> On 11/28/23 19:01, Danilo Krummrich wrote:
>> On 11/16/23 20:55, Timur Tabi wrote:
>>> On Thu, 2023-11-16 at 20:45 +0100, Danilo Krummrich wrote:
>>>> As I already mentioned for Timur's patch [2], I'd prefer to get a fix
>>>> upstream
>>>> (meaning [1] in this case). Of course, that's probably more up to Timur to
>>>> tell
>>>> if this will work out.
>>>
>>> Don't count on it.
>>
>> I see. Well, I think it's fine. Once we implement a decent abstraction we likely
>> don't need those header files in the kernel anymore.
>>
>> @Gustavo, if you agree I will discard the indentation change when applying the
>> patch to keep the diff as small as possible.
> 
> No problem.

Applied to drm-misc-fixes.

> 
> Thanks
> -- 
> Gustavo
> 
> 

