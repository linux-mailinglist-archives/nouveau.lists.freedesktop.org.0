Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F6C2243C9
	for <lists+nouveau@lfdr.de>; Fri, 17 Jul 2020 21:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AE36E3BC;
	Fri, 17 Jul 2020 19:05:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01596E3BC
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595012754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QA04z49XQxRpsbQtr5ADLmijNDZoNbT33TpqwbOswEA=;
 b=C7N7muYEzwti6rC/AlN+ZV25M3QCWvx13M4R4IAKJYkUmg4JXXs/1pkv8q3o0FjC4gcmnW
 Bo3FQPlMXsyNtd4zK7lcaLlGSuBFlGuSS3/w3dtbGfwd+XQKpvvf5fHUa9kGmEV+NtPgbO
 Mr4NCm9a5RAWa8WZjeyEUCpRYl61dJw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-O7jfDgiUN_2tgKisWpC0Jw-1; Fri, 17 Jul 2020 15:05:51 -0400
X-MC-Unique: O7jfDgiUN_2tgKisWpC0Jw-1
Received: by mail-ej1-f69.google.com with SMTP id b14so6367543ejv.14
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 12:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QA04z49XQxRpsbQtr5ADLmijNDZoNbT33TpqwbOswEA=;
 b=hVfRnhesql5nWJBFUfyB2M9E3JW+xcnFTrQYn664MtMF0HTYX6D3qa7w8+mebK746f
 2oFVt2WZHvRff6U5TKw6rn6bQhHOKAxnBvsMfbth2e5gge7iM2OJtAsl7bPBC9O+A6Zm
 ZrP1DXaaRCOv13QQZ+XIuJo573geNNqUpIy+VH6G8D6CPpXmSEgqWczszEKfuPinac/L
 hS5AxvTesHg92JI8mhdPXOv24dAmHxWIaWvJtbsxlOaRJYOj3/phyXi2EJfItH4bRR32
 wEuBK/8i5t3ELGmWRbyfzVF6iwChrWj5Mr5NzoA/yUsqgQyj7fk94eOFQ8HBcH8Dr55x
 Wegw==
X-Gm-Message-State: AOAM532lHQhlBwfbvOJCo1GWchy+q+D6AYgrdsJCnCPe1z/oNvGxwSfp
 4Yn5sZbWXBG5U+D6G/hxrwUq/MSioA+W24Ndry0sER7qqBRx8BtJ1nGTuRCDuX3+o5fdjzpx854
 yMjLgNWTqvSJx9ew5/GJ0K/JCOQ==
X-Received: by 2002:a17:906:a449:: with SMTP id
 cb9mr9659951ejb.115.1595012750754; 
 Fri, 17 Jul 2020 12:05:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxawMnEihhU00mwwY2KMXzPnp583S5oS9vU4nqqnr6E/4WlXYRDH2z1ZDUEgvDfZKxqw/acwg==
X-Received: by 2002:a17:906:a449:: with SMTP id
 cb9mr9659924ejb.115.1595012750517; 
 Fri, 17 Jul 2020 12:05:50 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id 92sm9030732edg.78.2020.07.17.12.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 12:05:49 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-acpi@vger.kernel.org
Date: Fri, 17 Jul 2020 21:05:47 +0200
Message-Id: <20200717190547.648604-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] RFC: ACPI / OSI: remove workarounds for hybrid
 graphics laptops
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
Cc: nouveau@lists.freedesktop.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Hung <alex.hung@canonical.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

It's hard to figure out what systems are actually affected and right now I
don't see a good way of removing those...

But I'd like to see thos getting removed and drivers fixed instead (which
happened at least for nouveau).

And as mentioned before, I prefer people working on fixing issues instead
of spending time to add firmware level workarounds which are hard to know
to which systems they apply to, hard to remove and basically a big huge
pain to work with.
In the end I have no idea how to even figure out what systems are affected
and which not by this, so I have no idea how to even verify we can safely
remove this (which just means those are impossible to remove unless we risk
breaking systems, which again makes those supper annoying to deal with).

Also from the comments it's hard to get what those bits really do. Are they
just preventing runtime pm or do the devices are powered down when booting?
I am sure it's the former, still...

Please, don't do this again.

For now, those workaround prevent power savings on systems those workaround
applies to, which might be any so those should get removed asap and if
new issues arrise removing those please do a proper bug report and we can
look into it and come up with a proper fix (and keep this patch out until
we resolve all of those).

Signed-off-by: Karol Herbst <kherbst@redhat.com>
CC: Alex Hung <alex.hung@canonical.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Len Brown <lenb@kernel.org>
CC: Lyude Paul <lyude@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: nouveau@lists.freedesktop.org
---
 drivers/acpi/osi.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
index 9f68538091384..d4405e1ca9b97 100644
--- a/drivers/acpi/osi.c
+++ b/drivers/acpi/osi.c
@@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
 	{"Processor Device", true},
 	{"3.0 _SCP Extensions", true},
 	{"Processor Aggregator Device", true},
-	/*
-	 * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
-	 * cards as RTD3 is not supported by drivers now.  Systems with NVidia
-	 * cards will hang without RTD3 disabled.
-	 *
-	 * Once NVidia drivers officially support RTD3, this _OSI strings can
-	 * be removed if both new and old graphics cards are supported.
-	 */
-	{"Linux-Dell-Video", true},
-	/*
-	 * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
-	 * audio device which is turned off for power-saving in Windows OS.
-	 * This power management feature observed on some Lenovo Thinkpad
-	 * systems which will not be able to output audio via HDMI without
-	 * a BIOS workaround.
-	 */
-	{"Linux-Lenovo-NV-HDMI-Audio", true},
-	/*
-	 * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
-	 * output video directly to external monitors on HP Inc. mobile
-	 * workstations as Nvidia and AMD VGA drivers provide limited
-	 * hybrid graphics supports.
-	 */
-	{"Linux-HPI-Hybrid-Graphics", true},
 };
 
 static u32 acpi_osi_handler(acpi_string interface, u32 supported)
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
