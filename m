Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25B1EE741
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 17:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C90F6E402;
	Thu,  4 Jun 2020 15:04:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6F16E402
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 15:04:20 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id l6so6405163ilo.2
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LngI92jGD0QZdOy6kZ5Tmr8Ff0OC1yZ/CGxWbpFolT8=;
 b=YS3aEKbVTKZDkSKeh0CX/xm9WTtmNACYiPRBDIeMX8MelYg3aX/45//1Qy2UGnptab
 HlDNcZDnEbu32YZJJzWL5dHsFExuLJ6QQXKHK/5CtyP7ni3GXKgW3rpT1OnZ7TUGRL5h
 Xe9aS9spm60GdmUKA8LQUdUQ8xYTDsLj3POVE73X/gaDiKwayQDq99kONQCIiGZiG7Wa
 1T0yp8LKAw1SVLuUYzn/kdUKksA4cOWp2yumBT9I7G6gtZ0h+sN5IPXuUy1c6iAFlDK4
 n/po9Icft2JhR0xk4cRTX9IL/GiBq/GEhDSQfMtNwdpoi5nsxMRVO/qn4QQcKqvDs9Vi
 HJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LngI92jGD0QZdOy6kZ5Tmr8Ff0OC1yZ/CGxWbpFolT8=;
 b=ZnbxEtmk7LXhhlwOmnuL6eElMtT7lp8tmkAOrk3JuQ5X5JnkWHEtZpmWl105ZaA44n
 6JsySwm58J3+h7izJGjzBDkhBCBXg+yo6+Fgvm3p1C1+odJhQqFeIT6u7+05hB99wBck
 CDFyOKYIAO6nvRwx9GSPdMKmXIVwQo1pxKZ0gPdiJMEqOebyY6ggzzf8k+ww8IHYrqtq
 UoOcoL7zjBG92/pbV+rAzsr8+xDK3962FjgHgjF9sv/JVleAOpvAo/4i31hutAtHvR4+
 ROJTFVJ1q0+jxBnMUtYsLi1r74GE853d8ij3sFIa0a6e8GlBaIvBnFX3dmSlZmXA3JJu
 7Qcg==
X-Gm-Message-State: AOAM532NFc7Wr0IKU0Gh9eRYGUNwjv17drvPnAA1FLNp2b0nRPTMLjOW
 7GaUNAdCFSKTFUYBy4I0Jtv7yjPCkCrDGXBbJ40=
X-Google-Smtp-Source: ABdhPJxE7Q4CFY/nkL5GSgsZYUCp7qF3I5XISpdtC4b0hk26y/JG0p0u7xwfc0+jU6YiyLx+h6E7Hh12eKUHWQBcnsA=
X-Received: by 2002:a92:db0b:: with SMTP id b11mr4267453iln.90.1591283059306; 
 Thu, 04 Jun 2020 08:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
In-Reply-To: <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Thu, 4 Jun 2020 17:04:08 +0200
Message-ID: <CAOkhzLXifEA2NvtDPFNsvH3bSDiH7ZLk0iRr2AkDDa6fO=fVfQ@mail.gmail.com>
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

Dear Ilia

Thank you for your reply.

On Thu, Jun 4, 2020 at 4:36 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> Starting with kernel 5.6, loading nouveau without firmware (for GPUs
> where it is required, such as yours) got broken.
>
> You are loading nouveau without firmware, so it fails.
>
> The firmware needs to be available to the kernel at the time of nouveau loading.

How can I tell the kernel to load the firmware?

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
