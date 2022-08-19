Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A3599C15
	for <lists+nouveau@lfdr.de>; Fri, 19 Aug 2022 14:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C97810EC3E;
	Fri, 19 Aug 2022 12:40:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C5710E66F
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 12:39:51 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11c9af8dd3eso4705680fac.10
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=nr2S/9qmmeGxcIMJGwRBKls76UGfEjRfvZrka29Qse8=;
 b=bYdF6/32WZb6uQ4FPEZ8kNUQ/fIvM6mHXAF/7Ew4fGLvSBc2FHr5tb59dmfFN4lKd+
 ptIq9HEvz01KcHOIIkeev3D7a+jUFyH53S3dNZ9ZPZu8W4c0F8PraBbhXtl9U0zrHZut
 ZiyMl2rVDS5td3kdJpCb3k8ahAnjEcK9jNUj3HzhGWTGl/MusXCdRiRSLR/4i8giIQp2
 iniyWO0E2tGVDRK0MqsuC0cuU5MmvRw+eVmXXWJyhEYelhxwB1YN6HI75thr5DaeZUON
 RgnzaZQPPBX5lMm9oNQOYJceYsjv94Vl8g49vlVBq1akr5yZIpRGwc+ZgmlnOycAaRlg
 mOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nr2S/9qmmeGxcIMJGwRBKls76UGfEjRfvZrka29Qse8=;
 b=X45UNH9wDbiNetsd1qAmU6LLokMhvUadT+2+dsvRXzrTZwf68AjYTfXEq5agDeORJ1
 pNvKUd55LRDVyom1GKfdK3yC1nzb9TCf2MNmy3vRfpru52ety+mCCuKYI/7//OdbxKW0
 g9TUe0joZXw1/L35u1XIt+GEF8HznEbVINilUtp2WlWCdJ+FS4T7oN073L/v2gOAij8a
 qAIIw+9RembOJwlWrF4TMhefiQVqwe2MqYZVtPr4uoNJGI6ry6HiNd2Uo/506+hLrEs+
 1Ea1vSJyVqkkmBTN895gEgmMBnmRDO0w7g2cIterMbk2sgJvHHjUSHAmharIwKp3MYEr
 ExWQ==
X-Gm-Message-State: ACgBeo1Wb6UwTdvTLCQeHfWuHvUfDtK0/PAxuzv9qviOfm8XjWNiBuxR
 bJjY7BOeU69tAgLOgZU9Xg/OvWU40ZkD31fG4V4=
X-Google-Smtp-Source: AA6agR7XOMtHCeMX2ezxyt9rHYxUV1UCgbZddIDClzDT5gZWoK7cqEVsbeoIvIbCjmcqTx/TX33xzxPu8PC+hLm4QxM=
X-Received: by 2002:a05:6870:a103:b0:11c:bdcb:e29 with SMTP id
 m3-20020a056870a10300b0011cbdcb0e29mr1852190oae.192.1660912790784; Fri, 19
 Aug 2022 05:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <459852889.305460.1660845770242.ref@mail.yahoo.com>
 <459852889.305460.1660845770242@mail.yahoo.com>
 <dfeb020b-ce01-5721-3aa3-8b9220c0ecb3@owenh.net>
In-Reply-To: <dfeb020b-ce01-5721-3aa3-8b9220c0ecb3@owenh.net>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Fri, 19 Aug 2022 14:39:38 +0200
Message-ID: <CAHSpYy1E_bJZ1pHamkXvrPN1pg-wdwPL3dFPWsr2yDs3DL-RBg@mail.gmail.com>
To: "David G. Pickett" <dgpickett@aol.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Ubuntu 22.04 LTS system freezes 5 minutes then
 unlocks on nouveau, was stable on 20.04 w/nvidia
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
Cc: "David G. Pickett" <DavidGPickett@comcast.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello,

Upgrading from Ubuntu 20.04 LTS to Ubuntu 22.04 LTS you upgraded the
kernel from version 5.4 to 5.17.

A similar issue ("[GT216][Linux 5.16.4] Long stalls in
dma_fence_default_wait") has been reported here for the Nvidia GT216:
see here [1] for the report and for the workaround and kernel patch.

HTH

[1] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
