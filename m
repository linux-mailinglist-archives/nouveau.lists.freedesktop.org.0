Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F1CC9CE9A
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 21:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B26410E6D2;
	Tue,  2 Dec 2025 20:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="c+L8QnBB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D75610E6BD
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 20:28:16 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-47775585257so41256715e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 02 Dec 2025 12:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764707295; x=1765312095;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Id46d5Vmg/QweH1w+t+fx2ST+00n7i1ciKT4MxLQ6Gk=;
 b=c+L8QnBBc59yI0fSEjtseAI7Vof/yW1jZ1CdyuZNp3W2nlPXAQBJH3VMkIom2Mb62x
 KtWmKgQDI+iaWk6t/1pdtZRad0c8mj6ezjBTCx18RrrqjQPuV7ShwNRwx312ROr+Hohc
 2PozHsovNqiETlKuHgrXkXEbRnNWeKFkTHVgOo9zqdS6hzB4zcnL6hi3a5pTafsxxqzt
 6gDCbc0hqHyKUtvN6qM7ktzFocCM413SLifvyoLQ0TKMtdx2SdFXn8Zew6Wj6kh/BIjy
 9q3z4aUJXSNotB9koyvxZudV34d3q4KkoRmFj1/Hjtj3e0AoetsIMHAUn/zE3ujJHti0
 pVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764707295; x=1765312095;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Id46d5Vmg/QweH1w+t+fx2ST+00n7i1ciKT4MxLQ6Gk=;
 b=wCNjPG5ML1rhaKia0A6ZcL4m+7WWkJk3UkOyTo9PIXPvy532d/cIeGeuicMGlrck4T
 eM+aEu/NtuPWpIOymI/ErRL1GhnYzegRPN2fpNp2+BQbxLMVjPECZ1Qe7Q+WktOZt41a
 xDDnEZ2pnn7wDkZlcPRUeUEaM6m639Spaw7/aCNMQ/RJZo9FXkVKIHH1Vm6W5RyckL3M
 9ou2WWy0p74vN4wL1F2O4Kd/BV/sMnPjhmBXSEpcnHRyPVcHIkoU6nlMdJHtwjNq1QuA
 G0/JWlgwMlVzZmIPvNG3B1ETu7kM3r9GBosfNcx0FH0dVe8mV9S1JXQO74rl+nLGfuw8
 KqIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+v2C4bukVj2I6vgsJJrDbwAq17dDyl0APEzsSpRAU7U2KPoxjpo8TR88E1TuDyzc3qJj0QL74@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxceCIKARwwkXk+C4ma81GLgC8Auc5zAiHeNPWv7CbNBa1CmOH8
 zN2EejlFKNf9Gmdkh/W14mmMpg3RaRogjpWuObnJ3iBFJv1/6uaT4B6ysJQdUn2SVEN22d2+oAE
 N95OgA7TU9otpUA0gDA==
X-Google-Smtp-Source: AGHT+IEV8MdqGcyCgbe2mt3hk2i0zy9sL5yMlrGz8Wfzitbo0qZDeAoS7Bz5wRmT2BDTK8lUXG2WtOVPXNGQznc=
X-Received: from wmqg19.prod.google.com ([2002:a05:600c:4ed3:b0:477:a1f9:138c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e91:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-4792a5ddcc9mr8270815e9.5.1764707294808; 
 Tue, 02 Dec 2025 12:28:14 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:59 +0000
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8979; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=ZnZgTS3QcWRawBw++AAPhDFQtHAEQIZjfTFyfZ+xDmk=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vY58X0j2N0y6zci+722T9v5vmhEw8pSHYzy
 bBoMvTYi1uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L2AAKCRAEWL7uWMY5
 RgpGD/0fasxYXiW6xVDDz8y4znLsMtXtDdRWNS+6bJ+27GT03cNM49SunHDvdbd1REYSO2YPMBz
 kPaPyVggZHDWnyck1v+MiaG+x4LW+ZRIkW8vaUrh+aymRIXxt76FsCU9rUOcgAZ16qMAGGpu6N+
 phlcZRw3rBj1By8r+yuXf8PdJKxCF4DbMGLkzT41x5F1+oHfjrHV4azKoBtDZzOLfrQf14dJ+wE
 MXz5NrtQdnDi8+fGcMM6T2TA4rimlfzl817O9Ho/Z4sbqYoYciomv8XvLM3z5hS9pzvjfB8UYF5
 u5m/OyCU61eDcrbiyQJbjny4mgxknTjmeUmsF5u1ihqApi8vbB/ZlYHyZL9MgJEkFKqHAyZKga2
 qEGd/jKKrArjdJwDk4TLcMwofyvdezUNx56N+IwbaQ8nKUWxV01veHHnkhvHWBCrkKPP5LvnemU
 woHsvvPGxiX3D6uXJDgzNM2ZaO4uNVFBDnjOkWEUCRvzPFg4muptJlGYfXtrbLGar7KWHu+0scl
 +2UMIdbTQV7p5t32aiJn3k4MV+FSMnPlbBEFJohWVT0dFSUgOeB1jnuJHp6oFzzhJtevrHVJ5iD
 N2Q7FYIYgHL3/LwM4YB/7bDJs6WhgzHaAsvSbU71oiP9t2Fmzvrx0ndD1YMaaBeWrcRhhwR+AH9
 PlvCH9Zp+KU5/LA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
Subject: [PATCH 4/4] build: rust: provide an option to inline C helpers into
 Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>, 
 Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
allow C helpers (which were created to allow Rust to call into
inline/macro C functions without having to re-implement the logic in
Rust) to be inlined into Rust crates without performing global LTO.

If the option is enabled, the following is performed:
* For helpers, instead of compiling them to an object file to be linked
  into vmlinux, they're compiled to LLVM IR.
* The LLVM IR is compiled to bitcode (This is step is not necessary, but
  is a performance optimisation to prevent LLVM from always have to
  reparse the same IR).
* When a Rust crate is compiled, instead of generating an object file, we
  ask LLVM bitcode to be generated.
* llvm-link is invoked with --internalize to combine the helper bitcode
  with the crate bitcode. This step is similar to LTO, but this is much
  faster since it only needs to inline the helpers.
* clang is invoked to turn the combined bitcode into a final object file.

The --internalize flag tells llvm-link to treat all symbols in
helpers.bc using `internal` linkage. This matches the behavior of
`clang` on `static inline` functions, and avoids exporting the symbol
from the object file.

To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
Disallow BTF generation with Rust + LTO") for details.

We have an intended triple mismatch of `aarch64-unknown-none` vs
`aarch64-unknown-linux-gnu`, so we suppress the warning.

Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile               |  4 +++-
 lib/Kconfig.debug      | 15 +++++++++++++++
 rust/Makefile          | 26 ++++++++++++++++++++++----
 rust/exports.c         |  5 ++++-
 scripts/Makefile.build |  5 ++++-
 5 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
--- a/Makefile
+++ b/Makefile
@@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
+LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
+LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
@@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP := 1
 export CLIPPY_CONF_DIR := $(srctree)
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
-export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd12dfd99d59f5080 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
 
 	  If unsure, say N.
 
+config RUST_INLINE_HELPERS
+    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
+    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
+    depends on EXPERT
+    help
+        Links C helpers into Rust crates through LLVM IR.
+
+        If this option is enabled, instead of generating object files directly,
+        rustc is asked to produce LLVM IR, which is then linked together with
+        the LLVM IR of C helpers, before object file is generated.
+
+        This requires a matching LLVM version for Clang and rustc.
+
+        If unsure, say N.
+
 endmenu # "Rust"
 
 endmenu # Kernel hacking
diff --git a/rust/Makefile b/rust/Makefile
index d7d19c21b671dea10242b1772a8bcf0bf5dcc1cd..2344e2662ce29280582215954132c09f63cd8c9d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,15 +6,19 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
+ifdef CONFIG_RUST_INLINE_HELPERS
+always-$(CONFIG_RUST) += helpers/helpers.bc
+else
+obj-$(CONFIG_RUST) += helpers/helpers.o
+always-$(CONFIG_RUST) += exports_helpers_generated.h
+endif
 # Missing prototypes are expected in the helpers since these are exported
 # for Rust only, thus there is no header nor prototypes.
-obj-$(CONFIG_RUST) += helpers/helpers.o
 CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations
 
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
 obj-$(CONFIG_RUST) += bindings.o pin_init.o kernel.o
-always-$(CONFIG_RUST) += exports_helpers_generated.h \
-    exports_bindings_generated.h exports_kernel_generated.h
+always-$(CONFIG_RUST) += exports_bindings_generated.h exports_kernel_generated.h
 
 always-$(CONFIG_RUST) += uapi/uapi_generated.rs
 obj-$(CONFIG_RUST) += uapi.o
@@ -468,6 +472,13 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+quiet_cmd_rust_helper = HELPER  $@
+      cmd_rust_helper = \
+	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) -c -g0 $< -emit-llvm -o $@
+
+$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
+	+$(call if_changed_dep,rust_helper)
+
 rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
 
 quiet_cmd_exports = EXPORTS $@
@@ -547,11 +558,13 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	OBJTREE=$(abspath $(objtree)) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_flags) \
-		--emit=dep-info=$(depfile) --emit=obj=$@ \
+		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 		--sysroot=/dev/null \
+	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) $(obj)/helpers/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
 	$(cmd_objtool)
 
@@ -678,4 +691,9 @@ $(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generate
 endif
 endif
 
+ifdef CONFIG_RUST_INLINE_HELPERS
+$(obj)/kernel.o: private link_helper = 1
+$(obj)/kernel.o: $(obj)/helpers/helpers.bc
+endif
+
 endif # CONFIG_RUST
diff --git a/rust/exports.c b/rust/exports.c
index 587f0e776aba52854080f15aa91094b55996c072..1b52460b0f4eeef6df9081abb9b7e054a28c3c21 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -16,10 +16,13 @@
 #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
 
 #include "exports_core_generated.h"
-#include "exports_helpers_generated.h"
 #include "exports_bindings_generated.h"
 #include "exports_kernel_generated.h"
 
+#ifndef CONFIG_RUST_INLINE_HELPERS
+#include "exports_helpers_generated.h"
+#endif
+
 // For modules using `rust/build_error.rs`.
 #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
 EXPORT_SYMBOL_RUST_GPL(rust_build_error);
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be95f8ba9a5c964ebecfbebc6c4bf8..04eaf2b4fbca2245f904a6dc7875cb3275aa7df6 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -343,7 +343,10 @@ rust_common_cmd = \
 # would not match each other.
 
 quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $< $(cmd_objtool)
+      cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_INLINE_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
+	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@) \
+	$(cmd_objtool)
 
 define rule_rustc_o_rs
 	$(call cmd_and_fixdep,rustc_o_rs)

-- 
2.52.0.158.g65b55ccf14-goog

