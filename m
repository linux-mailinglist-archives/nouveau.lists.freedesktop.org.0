Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8249D193
	for <lists+nouveau@lfdr.de>; Wed, 26 Jan 2022 19:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490510E5CE;
	Wed, 26 Jan 2022 18:21:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F8E10E7D8;
 Wed, 26 Jan 2022 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189970; x=1674725970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZMqEmNPU8hJMGD7NDLsKhN7Bqy2+39XosOb6FPsMBQ=;
 b=A9nYSP3YzUp1P8S0a8aPgOyZsansChQQ1//H8qnk23y4vt6H0vdjMcxO
 to2UOawNS6Cye+YKRIgWlsnL5O9c7Dhm+WK1u75EZUBnP1liZhXkMqbSO
 b6968ZFML9GLqEsVDYFZ+l/c6QEBU4muJ+CH2ggI4fwF+ciWd44T9Bjie
 jUPxAC+nYSc7hbpE6y+Z6w2pPYVAeSzY8Dh8Ze7F9gj5YN6Qmv6AyGsgH
 0NlDg6nObTnAHhmIvyS0bBvNZynxHE+WuvVzxBeSE8gcu+Z3ABVvqsb+P
 y02b0+dSlpENNSzX5ZBSEMjZkH7AXezeBH3W3LkI90+Q5iWkrKTB+ZXLE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227188781"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="227188781"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433082"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Date: Wed, 26 Jan 2022 01:39:42 -0800
Message-Id: <20220126093951.1470898-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Jan 2022 18:21:14 +0000
Subject: [Nouveau] [PATCH v2 02/11] drm/i915: Fix trailing semicolon
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove the trailing semicolon, as correctly warned by checkpatch:

	-:1189: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
	#1189: FILE: drivers/gpu/drm/i915/intel_device_info.c:119:
	+#define PRINT_FLAG(name) drm_printf(p, "%s: %s\n", #name, yesno(info->display.name));

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 93b251b25aba..94da5aa37391 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -114,7 +114,7 @@ void intel_device_info_print_static(const struct intel_device_info *info,
 	DEV_INFO_FOR_EACH_FLAG(PRINT_FLAG);
 #undef PRINT_FLAG
 
-#define PRINT_FLAG(name) drm_printf(p, "%s: %s\n", #name, yesno(info->display.name));
+#define PRINT_FLAG(name) drm_printf(p, "%s: %s\n", #name, yesno(info->display.name))
 	DEV_INFO_DISPLAY_FOR_EACH_FLAG(PRINT_FLAG);
 #undef PRINT_FLAG
 }
-- 
2.34.1

