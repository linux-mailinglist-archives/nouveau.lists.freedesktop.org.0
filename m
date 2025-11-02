Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD97CBABB3
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE6210EB09;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv9vY0fg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FE010E11F
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 22:49:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so28020575e9.3
 for <nouveau@lists.freedesktop.org>; Sun, 02 Nov 2025 14:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762123791; x=1762728591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yxZfP1EgwtZ2tiYeqX+Jv36xFp2c8XGw5hNT53dpp4c=;
 b=Qv9vY0fgnYn9P9BFHNQmSNDbmlsfixtSgblrMnT9GMnsWWmkYvV9fgiXHhIBhHOGaq
 7/CmNxnWg5bZml9GpVK01YuaPS8dsBf3dmhIsprpSTkBDrEub1+8BJ8lgCZPwqpAnd7Y
 F/74N8/7WYCesW9hBRdTYhWYaluqFsxnDM6ss5dIAq1CtAmtDRLBuRzk9pume06oUrSV
 /GAHOAt+5BVgezwtgfs+52K/uMAEGIH0ra+qD/C/5lHwGzch0KmBa0wHIUgcpxhG2i4S
 3Sb7uqKqTx/j15DUJ6wS2N9/NQNQEdTDIQlSOxw4pyObAJ1il9dxsbqVmettUZ0I4P16
 JoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762123791; x=1762728591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yxZfP1EgwtZ2tiYeqX+Jv36xFp2c8XGw5hNT53dpp4c=;
 b=rhhyM5SKFZTyfIiMbihR7QSa9nmbCiCBlMzhmDRa+bIYTjp1/BeSrxtRmDQGRUjbf2
 wL9+503sjC50EzhM/AOv8+JseFJf2CddxN2VvUDxuQ+MjnFBmUo6ObAwgJqLzkRnWgil
 jXZuATZju+hONcfvkSQpeZ3/KDDEniDK3uqmMkdPEf/2quxawX7VFr00wfpyzldwS5Yy
 ibKsnZcWhK9uAWLM7hPHLGCopvabQuNZZL6zdjYfeDie80wSzlcIsjvczpp/DQFzVAqB
 fyB8NbnGsi+BgNfgL590SfLXlSdTev9JeYOHZ+Wg5jr2QLh+xRHcTdCUfP6vAspNwFWL
 75QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa2JjPSIO80RknfixWbgplFf6GivTOTIiFCryYP4IK/PVOQvSklLOjUdnWy40oPnWq2nihsYfB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgwzntUmvhmk0FQ77+NcHmjoNnYDvhGPHDA0Kkpm5TvRdeE+5y
 mLL3E9DSwIbYQrvhSUEHOA+Nk0yXOKbHdfQNUhiVwH+DUsJPhnB/ZyFL
X-Gm-Gg: ASbGncsRSTsTReOq9u8tCvRo5f7sCz7IX/bO8WYYMyQc+fQ8+qSpfIe/aMoVAOqQwcx
 vzJDuCKwO5T/619+gBCARS+1+Pz0oAO7VsBSzN73DTvcvhpIjuvZan6GJwvLIDMBxlONi7yj8qm
 AVd7EF3dPhOxiu6U3CrfhxgPaAPkcBOpg6cXFYsE2kgcXizXuvvEToGkSDrAGraYZerMCsx1sgj
 PRvhT+X3A3Cq7HQ1K89un7dQFY/06bkYYq8/i0EWvHzsDnIFq7BegI5TeA38KcDFKJEmfQXa9zn
 79cNe42MuD8kFfrH6yNGgbWNmrMvBUgPYejjBEzXgsNAxbsxfIIWIAMwBfJvRXOVCRYvfJoQCPh
 wqiCTbcCLGcJ35PbgyNsRGJ4fr4ElHW0HKMKpjl2Kv6Da8liVLf+S+FtHWTCmmGUB62oRtGvgPn
 2fRc3RxmFKETYEl0v15frFSP3Wah2Dzk8PcOK3WRmEfoJMHvb9nc4A4hGJrtxzEFN/sss=
X-Google-Smtp-Source: AGHT+IHLr7QHAYyCpR7esydH0iZxndus/Yszg7n3Mbh2EIBSjYHhxzLG4Xv/sUpvArKaCvluQvwAug==
X-Received: by 2002:a05:600c:848d:b0:471:12c2:201f with SMTP id
 5b1f17b1804b1-477308b5986mr103587185e9.32.1762123791099; 
 Sun, 02 Nov 2025 14:49:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772ff83182sm72828245e9.4.2025.11.02.14.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 14:49:50 -0800 (PST)
Message-ID: <4b910f6f-9144-46a8-95c6-8e53bc83cd8c@gmail.com>
Date: Sun, 2 Nov 2025 23:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <DDXC17HXPXFZ.3TIX7FHUJHAI7@nvidia.com>
 <70210168-ee28-4996-89f0-83f8590cb716@gmail.com>
 <eb51b5d5-7f38-41f3-882c-eb87eb2b9f44@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <eb51b5d5-7f38-41f3-882c-eb87eb2b9f44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

On 11/2/25 17:08, Danilo Krummrich wrote:
> On 11/2/25 4:09 PM, Daniel del Castillo wrote:
>> About this, I was basing myself on nova-next [1]. I will rebase on top
>> of drm-rust-next for the next version.
>>
>>
>> Link: https://gitlab.freedesktop.org/drm/nova [1]
>> Link: https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next [2]
> 
> Yes, the nova tree is the one I started the project with. Meanwhile we have
> moved to use a common tree for DRM Rust infrastructure and drivers [3].
> 
> For the time being, the "original" nova tree is not in use anymore.
> 
> - Danilo
> 
> [3] https://lore.kernel.org/r/20250901202850.208116-1-dakr@kernel.org

I see, thanks for the explanation!
