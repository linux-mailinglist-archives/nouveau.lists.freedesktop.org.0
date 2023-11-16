Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD07EE91F
	for <lists+nouveau@lfdr.de>; Thu, 16 Nov 2023 23:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6501210E2CF;
	Thu, 16 Nov 2023 22:16:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370310E0EF;
 Thu, 16 Nov 2023 22:15:59 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4SWZ9m4dYjz9sqm;
 Thu, 16 Nov 2023 23:15:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1700172956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOs5PKValxWwrHSRlwT5CjuUgDsEUY/5qwCngDdQ3zg=;
 b=kDjPJbayGy0oHTuomMkZ0A2KY2B7z8B/c5Vox56YlXqprW5+e7r5R7svpnsbVR2dLLlUv8
 FefVqtlNtgGrpFVHC4UTcKW1V5Rl9vIluGSFS//ygN84udTaWyBycVB7By3XvnzTST2iM1
 FsR3JfL0hr6yKQXRFC2SrZEc2uuyskubLrGHNYPIy587BXn9FOOla7IKd473Y3mGP69KeQ
 VkjqhNeJzSwbfCPBh7IYsMNY/JUSpTAW19FBNWAo8EAhu71nivcmYIVrvqjnGEz8tC4V89
 zEbkVF4X+JiARv6Apgez/MKJVqGYdOMzeZePpjwKsG+fNLPIFZZLmsHpGkqR/g==
Message-ID: <2c23665d-7ba4-45f5-9065-76c58f6768b2@owenh.net>
Date: Thu, 16 Nov 2023 16:15:45 -0600
MIME-Version: 1.0
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
 <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
 <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
 <d1ac9c1e-f3fe-4d06-ba2e-2c049841d19b@owenh.net>
 <55698544-8cba-4413-bdd3-79cfaa1f3c44@redhat.com>
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <55698544-8cba-4413-bdd3-79cfaa1f3c44@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4SWZ9m4dYjz9sqm
Subject: Re: [Nouveau] [REGRESSION]: acpi/nouveau: Hardware unavailable upon
 resume or suspend fails
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/12/23 14:43, Hans de Goede wrote:
> Owen, Kai-Heng thank you for testing. I've submitted these patches
> to Rafael (the ACPI maintainer) now (with you on the Cc).
> Hopefully they will get merged soon.

That's great, thanks!

Owen

