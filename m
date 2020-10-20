Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83012945F6
	for <lists+nouveau@lfdr.de>; Wed, 21 Oct 2020 02:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABD16F450;
	Wed, 21 Oct 2020 00:19:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CC56EBA5
 for <nouveau@lists.freedesktop.org>; Tue, 20 Oct 2020 08:44:43 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d23so660549pll.7
 for <nouveau@lists.freedesktop.org>; Tue, 20 Oct 2020 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npY3XpZ1WJkzBlC4QeIItPlhppwYJDvN6wAnSiJqkk4=;
 b=d5KRK+lAAduNlPfivlmVntV0dRiwGVstNHD1SoFQZHyAOFWdms/0ESHmFRguL1oZUm
 r+6bsMs2s4+1J5By+h70CKYpgUOxZjJ7Sut+HyUehkBqzQ28jeVk44gTMPvxWONy+Bdy
 xLah6x21WHRc3sYeE2hXGEmHGfMwZurhJuz6fpoeWY7t+1JZ2eg8K8fVU2ugcYlNyS/D
 gHCNKqnmSvcK7Tm38y4xjmy6EX4Ouv1L8LfkcF/OFoxSYIMkkYemAxLeXUrjX4r/VGbp
 LeRdyoSoCWGPi4w8coabO6F1a9Am6Ul6rdMd4VKa8YRwzh+oOBPYf/eyb6nsgAfkMDBT
 6Shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npY3XpZ1WJkzBlC4QeIItPlhppwYJDvN6wAnSiJqkk4=;
 b=gpzd8+DAvIsES2Ko6+u09LzAtOUoFRIVPdRu2V+frRweyXeRtAl4IU8HxqdpuJSVoj
 OrLXahlUg7nZcYE2Ol3ZXyaz8yMCS5JcQ5wni98t20ogTI2Y57kdiPc7181vK2cux4U0
 ZEBNGV4iFC8R6K0QiwaATHJl+Gfpfei7AfEbVKHtiMm3yaQlIclEmZPZxdRpJztkN4ic
 QdeNrr7cLF9WsNZOx3EMpOJwn0IXBH2UWLfN0/jciE+F/42+KIVi+T7+xNGqAMX/ax3P
 5OpPskgR+nNv5+w2LP95ufotB3dt7xWDmxu7rG/6M3wERPC/Qgirb7Ik4XWxfqS+S5Cz
 ezNg==
X-Gm-Message-State: AOAM533MS+OvTX9crSsiGIxWtK78583kha/FjAvKzWDxUmAPsGWDPLQ5
 MarhWEKarEiHJUPekaqerhA=
X-Google-Smtp-Source: ABdhPJy0KshjnIva7Meea2Ko5m0iAPPCsedajlu8jwqMHPL+ziWAx64CDJM9j0yWa1K0yNDQIx/SDw==
X-Received: by 2002:a17:90a:678a:: with SMTP id
 o10mr1902383pjj.180.1603183482568; 
 Tue, 20 Oct 2020 01:44:42 -0700 (PDT)
Received: from localhost.localdomain ([117.246.150.152])
 by smtp.googlemail.com with ESMTPSA id y15sm1241581pjt.41.2020.10.20.01.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 01:44:41 -0700 (PDT)
From: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
To: 
Date: Tue, 20 Oct 2020 14:13:44 +0530
Message-Id: <20201020084345.96823-1-dmugil2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 00:19:07 +0000
Subject: [Nouveau] [PATCH] x86/mm/kmmio: correctly handle kzalloc return
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
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Pekka Paalanen <ppaalanen@gmail.com>, dmugil2000@gmail.com,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Replacing return value -1 to error code

Signed-off-by: Mugilraj Dhavachelvan <dmugil2000@gmail.com>
---
 arch/x86/mm/kmmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index be020a7bc414..15430520c232 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -386,7 +386,7 @@ static int add_kmmio_fault_page(unsigned long addr)
 
 	f = kzalloc(sizeof(*f), GFP_ATOMIC);
 	if (!f)
-		return -1;
+		return -ENOMEN;
 
 	f->count = 1;
 	f->addr = addr;
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
