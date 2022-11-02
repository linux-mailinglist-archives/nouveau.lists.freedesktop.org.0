Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6E6F6B3A
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A650610E3A5;
	Thu,  4 May 2023 12:31:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA5C10E461
 for <nouveau@lists.freedesktop.org>; Wed,  2 Nov 2022 10:35:48 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id cg5so2260932qtb.12
 for <nouveau@lists.freedesktop.org>; Wed, 02 Nov 2022 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2O1PKU8il9JO55wPK5nB5RoP7xPMplKzeMbq6mlhNZ8=;
 b=dMMZ/3n5LDVgMhxL8egs7WW2Q+mCdfOt78wcqKXv+qZUS7IxVIKsl7tm0A43dtvW5S
 r2Q1cCBkrpVurZGGu8rLkZ8bTIRhQ96ZiykjSZBwHK0/jYjMqGFeKdpMcemeLwsUN94e
 +dYIW42T2t4R/Liqi976B6RIeD2N+yCiRJ3EX2jkUnq12V3me2zBArgdiO3FzSxz9kQl
 J70O37+O1BAqwNSCzJKi14/gX5Wl5kzOudu38HwrcrQmgZgbm6HZhDMZ4xWSXZX7l0U8
 Y2/6h+OQkKbnRj0GeaEe2EHGF3afkBLQ+cNnSvByRV6nXYZ2KEnI+wZJdnJ2/tBH2o2z
 92og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O1PKU8il9JO55wPK5nB5RoP7xPMplKzeMbq6mlhNZ8=;
 b=oA5YTZUzMciYIGVKBMv4JAru6u1wSqF5myAxwR82DDK6cgWkUAS/J2QVmJm5XE6pBK
 PmBbdbMXkTeVpFo9aadW3oks4Y7+8+qzgLUiP5RXqa1TaUS946SiLReVdGlYQIYobnJB
 uCSEJeSXJQTuL7AUgNrrNjEeDrCGpzwuZ23z9xH7hPpn5WubI60lFV9ZEwK+AUhY/gvB
 byGij8AStGyCnTYNNT7D3oXmFa8kV6BJdJ2Va3VpxHXRGyo/jJ38fEnqV2hEPsU6Bkq9
 CbFbIek+rgifQx2tatHoz30Y5EHElwZoOuFPy5nAzckWbpnYJ+y4NR/gNBYf9clGBaW0
 W0Tw==
X-Gm-Message-State: ACrzQf3kMszSTiq+zr6q+N0CA8S1sdgRMydIvxidIv0rgX+vnmZLLlue
 tg+uE1I8BZTVFSW2NO+R2V70dc9KIYddvJqAprI=
X-Google-Smtp-Source: AMsMyM6X2qS0IzZn4VsJsNj7mkd7jHkm9WQyaw345XzWZADbYoZl/LD0DzpFlTgEfY7sdPZrhUlBhD7SgBpd35UhjdU=
X-Received: by 2002:ac8:7f48:0:b0:3a5:4234:8a18 with SMTP id
 g8-20020ac87f48000000b003a542348a18mr3529724qtk.340.1667385347479; Wed, 02
 Nov 2022 03:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221029074654.203153-1-zyytlz.wz@163.com>
In-Reply-To: <20221029074654.203153-1-zyytlz.wz@163.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 2 Nov 2022 18:35:36 +0800
Message-ID: <CAJedcCy5dxYPALk3Hib8J7ONLipXELpbehJHs58v8vuHk7ZupQ@mail.gmail.com>
To: Zheng Wang <zyytlz.wz@163.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:36 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: fix use-after-free bug in
 nvkm_vmm_pfn_map
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
Cc: alex000young@gmail.com, security@kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, bskeggs@redhat.com,
 daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Friendly Ping :)
