Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B53874E4
	for <lists+nouveau@lfdr.de>; Tue, 18 May 2021 11:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6F26EB19;
	Tue, 18 May 2021 09:17:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4343E6E84A
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 09:17:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i17so9337178wrq.11
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 02:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9eTPO/t6NCx/uQxkUlEH7zQPG+VNu47KdFOPfaH3erE=;
 b=K0J9+LUeBjKpfAq1eso85FwLWG/fzU/3gAs1+laTEAsGsadH4ShCeT1i/mRXGIb4A0
 dbEfer8uNPkFJB0IPEwS1v7fS29yW8JEUV27ePNg6MLa2FCThJan6FNhiKrf3QmcZ+tp
 GUa7D3d+Ay3IJBcuJGszjLzj/7q6ItNFNQHLyfomlcAUaz9jDOlMNUayZ7395NVTr1Ff
 6aZ/pFA1ZqEHWDOS9M+GWDwYXIZVQ39mbDG6FdBIG4+SdQpHZfcOBdpFRUH4Vj9TFwe1
 nlcGU3H9udX6PY8LB4AxngCmzlfyJVnMZpOZEs/2ISFuAD+i4jn4lVXYiWCZ1HntLN/I
 earA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9eTPO/t6NCx/uQxkUlEH7zQPG+VNu47KdFOPfaH3erE=;
 b=FIzmQL+W5CcdX0NiEa2ErQCo7+etEE/nD9wunWbn5kUoFBrGSwTDUcU4z9Zgl9QBp9
 0cG5sdsBm2T97yL8eV2AV2/RUV8BPXYlR8LF9fFhEipINMo+4ogNJiGLLB5OgTzas/mo
 M9SP6je1pPzUwpT15TemeH/nWx6Mt91v6oA6N4WsOmkoR/I7QL1GCBQWWBw8xjnjXPeR
 Vw5i5rzYKVt5HvjoR0DSfGMIg6/IJ0WHT6ZLJBfX+yo3yr5LBqHiHH/HTAnYjdZ9hgd7
 figOmv1w/RTeMq9MY20dVReSTDK+zcHAHg2aOayXiHnW2yS2R2RgdVtpA+8Zsbqo/NXv
 3kxg==
X-Gm-Message-State: AOAM530B9qD1cUXnkvis+6sJCwE2GrU/ty1fu/WI5g2NqV11u5TXmm2R
 /hKGpJcbzC+RWsxI22Ep8a9eBaJ9abVILlx0lCZGug==
X-Google-Smtp-Source: ABdhPJxN4k+wHiN+IopkT08sjmzmaYf2pZO0ZVnrzgFQ2RRcF6ozwlW5KmeBRhHPEiXC5UP8hW2E/0py4TRuOBk/3S0=
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr5496119wrz.256.1621329423850; 
 Tue, 18 May 2021 02:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
In-Reply-To: <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 18 May 2021 10:16:52 +0100
Message-ID: <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Nouveau] [PATCH 0/7] Per client engine busyness
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
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Simon Ser <contact@emersion.fr>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Nieto, David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> I was just wondering if stat(2) and a chrdev major check would be a
> solid criteria to more efficiently (compared to parsing the text
> content) detect drm files while walking procfs.

Maybe I'm missing something, but is the per-PID walk actually a
measurable performance issue rather than just a bit unpleasant?

Cheers,
Daniel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
