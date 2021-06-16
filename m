Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499363AA78D
	for <lists+nouveau@lfdr.de>; Thu, 17 Jun 2021 01:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104D96E846;
	Wed, 16 Jun 2021 23:35:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691CE6E054;
 Wed, 16 Jun 2021 23:35:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AC4D6128C;
 Wed, 16 Jun 2021 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623886530;
 bh=wPVQVbIbUSPCHwlQveBPypj0b7ZEUBG7b+pcNYSFUIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OMSb5BYNr5xaUbuoMHYk0NSbtNUpgEhtIwdXglhLvCqDrW5i5qa2Uyw/yckWpzgvr
 PAagI6UIzBwhdIGp+BcTlme/GBh0kO1sv8tBF0p4l6Hpe21d5Kiv3nkLUw9rd+xyjF
 ipJ2ogqHrqVqo0ogdHpSuhxubfuwK4SU8iDDFm8c=
Date: Wed, 16 Jun 2021 16:35:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Message-Id: <20210616163529.7de2f6e24d395c4ef7a367b6@linux-foundation.org>
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [Nouveau] [PATCH v11 00/10] Add support for SVM atomics in
 Nouveau
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com,
 shakeelb@google.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 16 Jun 2021 20:59:27 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> This is my series to add support for SVM atomics in Nouveau

Can we please have a nice [0/n] overview for this patchset?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
