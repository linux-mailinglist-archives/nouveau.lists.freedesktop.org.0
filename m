Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8D1EE77B
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 17:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23376E400;
	Thu,  4 Jun 2020 15:16:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD216E400
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 15:16:00 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id v11so6437442ilh.1
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHhQRFD5dXLk3tEs66mKWpDieuiW+fGGAlwHvRQW7yM=;
 b=XAh/zEHbGqVyZrM2oX8y+oTOMy45mOF1/MZlf3g1SNEcYwSLiz31nwMYMImLTU7hHQ
 ArnxLj+f5CKk2sTOGxe8pE6IGwURQxx7curAh3RrVHQzE1TWJoYHifXv3rwQXMECnyoB
 CysC0s0Eu0EOYgd3Vi+N94qBkjR9+3tmM5MmfgYAS3jdyyVPLTKSPCPDqzLK4nPF0bHw
 /BN4WVQHL4IxVc9t4s+AuDg7TbyASMZIwZlOTRZSbghBIzbj1+NtC3xaXsf8XG33YcGY
 8KKKCrJMRdeofjD11fzx2DG+1DmXBsV2T3BTBDBNF45Uj9ccecJ7Xjad9AzY5WgJ+rEt
 oWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHhQRFD5dXLk3tEs66mKWpDieuiW+fGGAlwHvRQW7yM=;
 b=SU3YKour4KnXYUrORHO0iUZQKstvXwxAS9JCv25PcDTv5LCtlzxci55dbrg9gDdPhO
 cPqt1ySHlqb3hAf+E95JGk3I/SU3eUEBxxrJytrvOIc2UzSuMxwxI/oWbRQNvc0eSLJD
 I+DnH/gs2xSWzvvgeu2y+L4dPpNnAziwcBDzDP3yjegI1uIkM+YVf2DaS8KNxnZ46+2D
 YpY5OGiSlZD8UZ/La7ExwaKBOB4ihzmmPeiPnwYzJ0ZuuU5qmvevNDI/1tU5jtvQC9G5
 cVYrXKU6lqs7FcOLqD36v7ZWSnrjTKAuBpC4LgqRzcjSjmwDjuGKs9c/ahQt9kPzs3kU
 5qpQ==
X-Gm-Message-State: AOAM532G1nqrqxPDepCs5dtY6GSlPTkfH9DMM35BmIT8KB3KETI4oA7N
 iOqhyFbWRFfaktOqbjLk8jFHVfbtP+aCtYdDLeKDgftcS8c=
X-Google-Smtp-Source: ABdhPJzkVPqhXVmoY1skaPXsZIWDQ+EAQ6FvWbKKIu+LD3tCklbO+QT85Ay4tm7zgFdr+vudymZBkXSCuIvaqLUtsjs=
X-Received: by 2002:a92:af44:: with SMTP id n65mr4152893ili.61.1591283759746; 
 Thu, 04 Jun 2020 08:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
In-Reply-To: <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Thu, 4 Jun 2020 17:15:48 +0200
Message-ID: <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 4:36 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Starting with kernel 5.6, loading nouveau without firmware (for GPUs
> where it is required, such as yours) got broken.
>
> You are loading nouveau without firmware, so it fails.
>
> The firmware needs to be available to the kernel at the time of nouveau loading.

Ok, I am now trying this:

/usr/src/linux> grep FIRMWARE /usr/src/linux/.config
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_EXTRA_FIRMWARE="nvidia/gp107/gr/sw_nonctx.bin"
# CONFIG_CYPRESS_FIRMWARE is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
# CONFIG_FIRMWARE_EDID is not set
# CONFIG_TEST_FIRMWARE is not set

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
